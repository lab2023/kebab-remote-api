$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kebab_remote_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kebab_remote_api"
  s.version     = KebabRemoteApi::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of KebabRemoteApi."
  s.description = "TODO: Description of KebabRemoteApi."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency 'pg', '~> 0.15.1'
  s.add_dependency 'sass-rails', '~> 4.0.0'
  s.add_dependency 'uglifier', '>= 1.3.0'
  s.add_dependency 'coffee-rails', '~> 4.0.0'
  s.add_dependency 'jquery-rails', '~> 3.0.4'
  s.add_dependency 'turbolinks', '~> 1.3.0'
  s.add_dependency 'haml', '~> 4.0.2'
  s.add_dependency 'haml-rails'
  s.add_dependency 'bootstrap-sass', '~> 2.3.1.0'
  s.add_dependency 'responders', '~> 1.0.0.rc'
  s.add_dependency 'exception_notification', '~> 4.0.0'
  s.add_dependency 'simple_form', '~> 3.0.0.rc'
  s.add_dependency 'rails_config', '~> 0.3.3'
  s.add_dependency 'compass-rails'#, github: 'Compass/compass-rails', branch: 'rails4-hack'
  s.add_dependency 'devise', '~> 3.0.0'
  s.add_dependency 'devise-i18n', '~> 0.8.6'
  s.add_dependency 'will_paginate', '~> 3.0.4'
  s.add_dependency 'will_paginate-bootstrap', '~> 0.2.3'
  s.add_dependency 'will-paginate-i18n', '~> 0.1.13'
  s.add_dependency 'paperclip', '~> 3.5.1'
  s.add_dependency 'kangal', '~> 0.1.2'
  s.add_dependency 'enumerize', '~> 0.7.0'
  s.add_dependency 'vmstat', '~> 2.0.0'

  s.add_development_dependency "sqlite3"
end
