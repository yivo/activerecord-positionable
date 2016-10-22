# encoding: utf-8
# frozen_string_literal: true

require 'active_support/concern'
require 'active_record'
require 'activerecord-traits'

require 'activerecord-sortable/extension'
require 'activerecord-sortable/sort'
require 'activerecord-sortable/migration'

class ActiveRecord::Base
  include Sortable::Extension
end

class ActiveRecord::ConnectionAdapters::TableDefinition
  include Sortable::Migration
end

begin
  require 'essay'
  require 'activerecord-sortable/essay'
rescue LoadError
end
