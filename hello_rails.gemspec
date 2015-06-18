# coding: utf-8
File.expand_path('../lib', __FILE__).tap do |lib|
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
end

require 'hello_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "hello_rails"
  spec.version       = HelloRails::VERSION
  spec.authors       = ["Freddy Rangel"]
  spec.email         = ["freddy.rangel@hellosign.com"]
  spec.summary       = %q{A simple Rails application generator that builds applications with the common customization stuff already done.}
  spec.homepage      = "https://github.com/freddyrangel/hello_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
end
