# Shackleton

A URL builder DSL, set up your API routes, and then call to build your URL

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shackleton'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shackleton

## Usage

```ruby
map = Shackleton.mapper do
  route :line, 'line(/:id)' do
    route :meta do
      route :modes
      route :severity
      route :disruption_categories, 'disruptioncategories'
      route :service_types, 'servicetypes'
    end
    route :mode, 'mode/:modes' do
      route :route
    end
  end
end

map.line(id: 'northern').meta.modes.to_s #=> 'line/10/meta/modes'
map.line(id: 'northern').mode(mode: 'tube', detail: true).to_s #=> 'line/10/meta/modes?detail=true'
map.line.meta.modes.to_s #=> 'line/meta/modes'
```

The mapper defines the structure of the urls, and when you call each fragment, your aruments are captured and then replayed to create your URL, undefined query params are supported, they're attached to the end of the URI

`
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adamcarlile/shackleton.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
