```ruby
  class Article < ActiveRecord::Base
    acts_as_sortable
  end

  Article.features.sortable?                   # => true
  Article.attribute_roles[:position].position? # => true
```

## Gemfile
```ruby
gem 'activerecord-sortable', github: 'yivo/activerecord-sortable'
```