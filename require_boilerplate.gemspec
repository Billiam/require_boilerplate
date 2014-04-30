# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
require File.expand_path('../lib/require_boilerplate/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "require_boilerplate"
  gem.version       = RequireBoilerplate::VERSION
  gem.summary       = %q{TODO: Summary}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = [""]
  gem.email         = ""
  gem.homepage      = "https://rubygems.org/gems/require_boilerplate"

  gem.files         = Dir["{lib}/**/*.rb", "{lib}/**/*.rake", "{lib}/**/*.yml", "LICENSE", "*.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
