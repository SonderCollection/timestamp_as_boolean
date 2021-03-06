# TimestampAsBoolean

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/timestamp_as_boolean`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'timestamp_as_boolean'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install timestamp_as_boolean

## Usage

1. Include `TimestampAsBoolean` in the model
  eg:
  ```ruby
  class SampleClass < ActiveRecord::Base
    include TimestampAsBoolean
  end
  ```

2. Now, assuming your model has a field named `accepted_at`, add `timestamp_as_boolean :accepted` to create a pseudo boolean field that will set or unset the timestamp when the boolean field was first turned to true.
  ```ruby
  class SampleClass < ActiveRecord::Base
    include TimestampAsBoolean
    timestamp_as_boolean :accepted
  end
  ```

3. `accepted` can now be used like any other ruby boolean attribute.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SonderCollection/timestamp_as_boolean.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

