# Using sortable with has_and_belongs_to_many
#
# articles_tags
# id  article_id  tag_id  position
#  1           3       1         1
#  2           2       2         2
#  3           6       2         3
#  4           2       1         4
#  5           3       2         5
#
class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags
end

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
end

# Using sortable with has_many
class Article < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
end

class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :articles, through: :taggings
end

class Tagging < ActiveRecord::Base
  sortable :position

  belongs_to :article
  belongs_to :tag
end

module Sortable
  class << self
    def perform(model, new_position)
      sortable_options = model.class.sortable_options

      attr = sortable_options[:attribute_name]

      new_p = new_position.to_i
      old_p = model.send(attr)

      now = model.class.default_timezone == :utc ? Time.now.utc : Time.now

      #
      # 5 => 3
      if new_p < old_p
        # 2 => 2
        # 3 => 4
        # 4 => 5
        # 5 => 5

        # 5 => 3
        model.class.unscoped.where('position >= ? and position < ?', new_p, old_p)
          .update_all("position = position + 1, updated_at = #{now}")

        # 3 => 5
      elsif old_p < new_p
        # 3 => 3
        # 4 => 3
        # 5 => 4

        # 3 => 5
        model.class.unscoped.where('position > ? and position <= ?', old_p, new_p)
          .update_all("position = position - 1, updated_at = #{now}")

      end

      model.position = new_p
      model.save!
    end
  end
end