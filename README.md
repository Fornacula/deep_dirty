# DeepDirty

`ActiveModel::Dirty` does not track changes that are _destructive_ or _inplace_:

    user = User.first
    user.name.upcase!
    u.changed?          # => false

`DeepDirty` fixes this by adding a `before_validation` hook that compares all attributes to their `before_type_cast` values and records any changes.

## Installation

Add this line to your application's Gemfile:

    gem 'deep_dirty'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deep_dirty

## Usage

In an `ActiveModel` include this module:

    class User < ActiveRecord::Base
        include DeepDirty
    end

    user = User.first
    user.name.upcase!
    user.valid?
    user.changed?       # => true
    user.changes        # => {"name" => ["Test User", "TEST USER"]}


Alternatively if you need to check changes without calling validation, use `deep_changed?`:

    user = User.first
    user.name.upcase!
    user.changed?       # => false
    user.deep_changed?  # => true
    user.changed?       # => true
    user.changes        # => {"name" => ["Test User", "TEST USER"]}


## Contributing

1. Fork it ( https://github.com/borgand/deep_dirty/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
