# encoding: utf-8
# frozen_string_literal: true

module Sortable
  module Extension
    extend ActiveSupport::Concern

    included { class_attribute :sortable }

    module ClassMethods
      #
      # class Article < ActiveRecord::Base
      #   acts_as_sortable
      # end
      #
      def acts_as_sortable
        scope :sorted, -> { order(position: :desc) }
        scope :latest, -> { sorted }

        after_save do
          update_column(:position, id) if position.blank?
          nil
        end

        self.sortable = true
        nil
      end
    end
  end
end
