require 'active_support/all'
require 'active_record'
require 'activerecord-traits'

require 'activerecord-sortable/extension'
require 'activerecord-sortable/column_types'
require 'activerecord-sortable/essay' if defined?(Essay)

module ActiveRecord
  Base.include Sortable::Extension
  ConnectionAdapters::TableDefinition.include Sortable::ColumnTypes
end

module Sortable
  class << self
    attr_accessor :default_options
    attr_accessor :default_column
  end

  self.default_column = :position
end