module Sortable
  module ColumnTypes
    def position(*args)
      options      = args.extract_options!.reverse_merge!(index: true)
      column_names = args.presence || [Sortable.default_column]
      column_names.each { |name| column(name, :integer, options) }
    end
  end
end