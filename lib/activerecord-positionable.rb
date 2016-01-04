require 'active_support/all'
require 'active_record'
require 'activerecord-traits'

require 'activerecord-positionable/extension'
require 'activerecord-positionable/migration'
require 'activerecord-positionable/essay' if defined?(Essay)

ActiveRecord::Base.include(Positionable::Extension)