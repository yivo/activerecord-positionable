# frozen_string_literal: true
module Sortable
  module ColumnTypes
    # http://dba.stackexchange.com/questions/11031/order-by-column-should-have-index-or-not
    def position(*args)
      options      = args.extract_options!.reverse_merge!(index: true)
      column_names = args.presence || [Sortable.default_column]
      column_names.each { |name| column(name, :integer, options) }
    end
  end
end
