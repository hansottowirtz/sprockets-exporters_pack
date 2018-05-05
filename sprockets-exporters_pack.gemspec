# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprockets/exporters_pack/version'

Gem::Specification.new do |spec|
  spec.name          = 'sprockets-exporters_pack'
  spec.version       = Sprockets::ExportersPack::VERSION
  spec.authors       = ['Hans Otto Wirtz']
  spec.email         = ['hansottowirtz@gmail.com']

  spec.summary       = 'Adds multiple exporters to Sprockets'
  spec.homepage      = 'https://github.com/hansottowirtz/sprockets-exporters_pack'
  spec.license       = 'MIT'

  spec.files         = Dir['README.md', 'LICENSE', 'lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 1.14'
  spec.add_development_dependency 'rake', '>= 10.0'

  spec.add_dependency 'brotli', '>= 0.2.0'
  spec.add_dependency 'sprockets', '>= 4.0.0.beta3'
end
