class ActiveRecord::ConnectionAdapters::TableDefinition
  def position(*args)
    options      = { null: false, index: true, default: 0 }.merge!(args.extract_options!)
    column_names = args.presence || [:position]
    column_names.each { |name| column(name, :integer, options) }
  end
end