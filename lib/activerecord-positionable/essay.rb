module Essay
  class ModelFeatures
    def positionable?
      model_class.positionable_options.any?
    end
  end

  class AttributeRoles
    def position?
      list = model_class.attributes_marked_as_position
      !!list && list.include?(attribute_name)
    end
  end
end