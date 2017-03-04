# Sprockets::ExportersPack

This gem aims to add some exporters to [sprockets][rails/sprockets], which are currently [under review][PR].

Currently, it has:
- a Brotli exporter, which should be used with [ngx_brotli][google/ngx_brotli].

## Installation

Add this line to your `Gemfile`:

```ruby
gem 'sprockets-exporters_pack'
```

```bash
$ bundle install
```

## Usage

With Rails, in `application.rb`:

```ruby
config.assets.configure do |env|
  env.register_exporter %w(text/css application/javascript image/svg+xml), Sprockets::ExportersPack::BrotliExporter
end
```

Without Rails:

```ruby
env = Sprockets::Environment.new
env.register_exporter %w(text/css application/javascript image/svg+xml), Sprockets::ExportersPack::BrotliExporter
```

## Contributing

Yes please! Open an issue with exporters you want to see added.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[PR]: https://github.com/rails/sprockets/pull/386
[rails/sprockets]: https://github.com/rails/sprockets
[rails/rails]: https://github.com/rails/rails
[google/ngx_brotli]: https://github.com/google/ngx_brotli
