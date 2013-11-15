$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kebab_remote_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        		 = "kebab_remote_api"
  s.version     		 = KebabRemoteApi::VERSION
  s.authors     		 = %w[lab2023]
  s.email       		 = %w[info@lab2023.com]
  s.homepage    		 = "https://github.com/kebab-project/kebab-remote-api"
  s.summary     		 = %q{This is a JSON data sender gem for a Cybele initialized Rails project.}
  s.description 		 = %q{Kebab Remote API is a gem that sends spesific server data through JSON.}
  s.license     		 = 'MIT'
  s.extra_rdoc_files = %w[README.md SECURITY.md]

  s.files = `git ls-files`.split("\n")
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = %w[lib]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency 'enumerize', '~> 0.7.0'
  s.add_dependency 'vmstat', '~> 2.0.0'
  #s.add_dependency 'pg', '~> 0.16.0'
  #s.add_dependency 'responders', '~> 1.0.0.rc'
  #s.add_dependency 'rails_config', '~> 0.3.3'
  #s.add_dependency 'devise', '~> 3.0.0'
  #s.add_dependency 'devise-i18n', '~> 0.9.2'
  #s.add_dependency 'sass-rails', '~> 4.0.0'
  #s.add_dependency 'uglifier', '>= 1.3.0'
  #s.add_dependency 'coffee-rails', '~> 4.0.0'
  #s.add_dependency 'jquery-rails', '~> 3.0.4'
  #s.add_dependency 'turbolinks', '~> 1.3.0'
  #s.add_dependency 'haml', '~> 4.0.2'
  #s.add_dependency 'haml-rails'
  #s.add_dependency 'bootstrap-sass', '~> 2.3.1.0'
  #s.add_dependency 'exception_notification', '~> 4.0.0'
  #s.add_dependency 'simple_form', '~> 3.0.0.rc'
  #s.add_dependency 'compass-rails'#, github: 'Compass/compass-rails', branch: 'rails4-hack'
  #s.add_dependency 'will_paginate', '~> 3.0.4'
  #s.add_dependency 'will_paginate-bootstrap', '~> 0.2.3'
  #s.add_dependency 'will-paginate-i18n', '~> 0.1.13'
  #s.add_dependency 'paperclip', '~> 3.5.1'
  #s.add_dependency 'kangal', '~> 0.1.2'

  s.add_development_dependency "sqlite3"
end
