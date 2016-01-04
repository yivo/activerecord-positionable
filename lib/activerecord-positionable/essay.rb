module Essay
  class ModelFeatures
    def positionable?
      model_class.positionable_options.any?
    end

    serialize do
      { is_positionable: positionable? }
    end
  end

  class AttributeFeatures
    def position?
      model_class.attributes_marked_as_position.include?(attribute_name)
    end

    serialize do
      { is_position: position? }
    end
  end
end