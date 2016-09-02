# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprockets/exporters/version'

Gem::Specification.new do |spec|
  spec.name          = 'sprockets-exporters'
  spec.version       = Sprockets::Exporters::VERSION
  spec.authors       = ['Hans Otto Wirtz']
  spec.email         = ['hansottowirtz@gmail.com']

  spec.summary       = 'Adds multiple exporters to Sprockets'
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/hansottowirtz/sprockets-exporters'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_dependency 'brotli', '~> 0.1.2'
  spec.add_dependency 'zopfli', '~> 0.0.4'
end
