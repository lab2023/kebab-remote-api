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

  s.add_development_dependency "sqlite3"
end
