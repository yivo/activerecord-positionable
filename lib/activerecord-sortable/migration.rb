# encoding: utf-8
# frozen_string_literal: true

module Sortable
  module Migration
    # http://dba.stackexchange.com/questions/11031/order-by-column-should-have-index-or-not
    def position(options = {})
      column :position, :integer, options.reverse_merge!(index: true)
    end
  end
end
