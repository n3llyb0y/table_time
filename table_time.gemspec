# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'table_time/version'

Gem::Specification.new do |spec|
  spec.name          = 'table_time'
  spec.version       = TableTime::VERSION
  spec.authors       = ['Neil Chambers']
  spec.email         = ['n3llyb0y.uk@gmail.com']

  spec.summary       = 'table generator'
  spec.description   = 'utility for generating tabular data'
  spec.homepage      = 'https://github.com/n3llyb0y/table_time'

  spec.files         = Dir.glob("{bin,lib}/**/*") + %w(README.md CHANGELOG.md)
  spec.executables   = ['tabletime']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
