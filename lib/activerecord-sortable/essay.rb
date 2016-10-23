# encoding: utf-8
# frozen_string_literal: true

module Essay
  class ModelFeatures
    def sortable?
      !!active_record.sortable?
    end

    serialize do
      { is_sortable: sortable? }
    end
  end

  class AttributeFeatures
    def position?
      active_record_features.sortable? && attribute.name == :position
    end

    serialize do
      { is_position: position? }
    end
  end
end
