module Sortable
  module Extension
    extend ActiveSupport::Concern

    module ClassMethods
      #
      # class Article < ActiveRecord::Base
      #   acts_as_sortable
      # end
      #
      def acts_as_sortable(options = {})
        position = Sortable.default_column

        scope :sorted, -> { order(position => :desc).order(id: :desc) }

        class << self
          alias latest sorted
        end

        after_save :"assign_#{position}!", unless: :"#{position}?"

        class_eval <<-BODY, __FILE__, __LINE__ + 1
          def assign_#{position}!
            self.#{position} = id
            save!
          end
        BODY

        unless respond_to?(:sortable_options)
          class_attribute :sortable_options, instance_accessor: false, instance_predicate: false
        end

        self.sortable_options = options
      end
    end
  end
end