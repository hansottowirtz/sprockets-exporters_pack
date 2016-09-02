# Sprockets::Exporters

This gem aims to add some exporters to sprockets, which are currently [under review][PR].

Currently, it has:
- a Zopfli exporter, which has a better compression ratio than the original Zlib.
- a Brotli exporter, which should be used with [ngx_brotli][google/ngx_brotli].

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

Note: to use `Sprockets::Exporters::ZopfliExporter`, you must unregister `GzipExporter`, like this:

```ruby
env.unregister_exporter GzipExporter
env.register_exporter '...', Sprockets::Exporters::ZopfliExporter
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hansottowirtz/sprockets-exporters. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[PR]: https://github.com/rails/sprockets/pull/372
[rails/rails]: https://github.com/rails/rails
[google/ngx_brotli]: https://github.com/google/ngx_brotli
