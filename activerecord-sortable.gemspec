# encoding: utf-8
# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name            = 'activerecord-sortable'
  s.version         = '1.0.3'
  s.authors         = ['Yaroslav Konoplov']
  s.email           = ['eahome00@gmail.com']
  s.summary         = 'ActiveRecord sortable'
  s.description     = 'ActiveRecord sortable'
  s.homepage        = 'http://github.com/yivo/activerecord-sortable'
  s.license         = 'MIT'

  s.executables     = `git ls-files -z -- bin/*`.split("\x0").map{ |f| File.basename(f) }
  s.files           = `git ls-files -z`.split("\x0")
  s.test_files      = `git ls-files -z -- {test,spec,features}/*`.split("\x0")
  s.require_paths   = ['lib']

  s.add_dependency 'activesupport',       '>= 3.0', '< 6.0'
  s.add_dependency 'activerecord',        '>= 3.0', '< 6.0'
  s.add_dependency 'activerecord-traits', '~> 1.1'
end
