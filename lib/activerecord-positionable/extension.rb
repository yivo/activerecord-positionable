module Positionable
  module Extension
    extend ActiveSupport::Concern

    included do
      # Stores scope name, position attribute name
      class_attribute :positionable_options, instance_accessor: false, instance_predicate: false

      class_attribute :attributes_marked_as_position, instance_accessor: false, instance_predicate: false

      self.positionable_options          = {}
      self.attributes_marked_as_position = []
    end

    module ClassMethods
      def positionable(attr_name = :position)
        position_attr(attr_name)

        scope :ordered, -> { order(Hash[attr_name, :desc]).order(id: :desc) }
        scope :latest,  -> { ordered }

        self.positionable_options = positionable_options.deep_dup.merge!(
          attribute: attr_name,
          scope: :ordered
        )
      end

      def position_attr(*attr_names)
        attr_names.each do |attr_name|
          after_save :"assign_#{attr_name}!", if: :"#{attr_name}_missing?"

          class_eval <<-BODY, __FILE__, __LINE__ + 1
            def #{attr_name}_missing?
              self[:#{attr_name}].blank?
            end

            def assign_#{attr_name}!
              self[:#{attr_name}] = id
              save!
            end
          BODY
        end
        self.attributes_marked_as_position += attr_names
      end
    end
  end
end