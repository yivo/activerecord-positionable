# encoding: utf-8
# frozen_string_literal: true

module Essay
  class ModelFeatures
    def sortable?
      !!model_class.sortable?
    end

    serialize do
      { is_sortable: sortable? }
    end
  end

  class AttributeFeatures
    def position?
      model_features.sortable? && attribute_name == :position
    end

    serialize do
      { is_position: position? }
    end
  end
end
