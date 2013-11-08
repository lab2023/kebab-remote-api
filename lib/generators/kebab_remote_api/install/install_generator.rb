require 'rails/generators'
require 'rails/generators/base'

module KebabRemoteApi
	module Generators
		class InstallGenerator < ::Rails::Generators::Base
			desc "Copies KebabRemoteApi models, migrations and locales"
  		source_root File.expand_path('../templates', __FILE__)

  		def copy_models
  			directory 'models', 'app/models'
			end
		end
	end
end