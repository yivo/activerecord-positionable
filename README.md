```ruby
  class Article < ActiveRecord::Base
    positionable
  end

  Article.features.positionable?                # => true
  Article.attribute_roles[:position].position?  # => true
```

## Gemfile
```ruby
gem 'activerecord-positionable', github: 'yivo/activerecord-positionable'
```