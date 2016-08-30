# Sprockets::Exporters

This gem aims to add some exporters to sprockets, which are currently [under review][PR].

Currently, there is a Brotli exporter, which should be used with [Rails][rails/rails] and [ngx_brotli][google/ngx_brotli].

## Installation

Add this line to your `Gemfile`:

```ruby
gem 'sprockets', github: 'hansottowirtz/sprockets', branch: 'exporting'
gem 'sprockets-exporters'
```

```bash
$ bundle install
```

## Usage

With Rails, in `application.rb`:

```ruby
config.assets.configure do |env|
  env.register_exporter %w(text/css application/javascript image/svg+xml), Sprockets::Exporters::BrotliExporter
end
```

Without Rails:

```ruby
env = Sprockets::Environment.new
env.register_exporter %w(text/css application/javascript image/svg+xml), Sprockets::Exporters::BrotliExporter
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hansottowirtz/sprockets-exporters. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[PR]: https://github.com/rails/sprockets/pull/372
[rails/rails]: https://github.com/rails/rails
[google/ngx_brotli]: https://github.com/google/ngx_brotli
