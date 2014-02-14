# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_stream/version'

Gem::Specification.new do |spec|
  spec.name          = 'simple_stream'
  spec.version       = SimpleStream::VERSION
  spec.authors       = ['Jason Kriss']
  spec.email         = ['jasonkriss@gmail.com']
  spec.summary       = %q{Stripped-down Twitter streaming API client.}
  spec.homepage      = 'https://github.com/jasonkriss/simple_stream'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'addressable', '~> 2.3'
  spec.add_dependency 'http', '~> 0.5.0'
  spec.add_dependency 'simple_oauth', '~> 0.2.0'
  spec.add_dependency 'buftok', '~> 0.2.0'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
