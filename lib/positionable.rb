# TODO Refactor
# TODO Write Essay

require 'active_record'

class ActiveRecord::Base
  def self.is_positionable(attr_name = :position)
    attr_default attr_name, 0
    scope :ordered, -> { order(Hash[attr_name, :desc]).order(id: :desc) }
    scope :latest, -> { ordered }
    after_save :"assign_#{attr_name}!"

    class_eval <<-BODY, __FILE__, __LINE__ + 1
      def assign_position!
        if attr && self[:#{attr_name}].blank?
          self[:#{attr_name}] = id
          save!
        end
      end
    BODY

    features.get(:positionable).set(:attribute_name, attr_name)
    roles[attr_name].mark(:position)
  end
end