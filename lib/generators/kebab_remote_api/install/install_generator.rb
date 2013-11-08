require 'rails/generators'
require 'rails/generators/base'
require 'rails/generators/migration'
require 'rails/generators/active_record'

module KebabRemoteApi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc "Copies KebabRemoteApi models, migrations and locales"
      source_root File.expand_path('../templates', __FILE__)

      def copy_models
        directory 'models', 'app/models'
      end

      def self.next_migration_number(dirname)
        ActiveRecord::Generators::Base.next_migration_number(dirname)
      end

      def create_migration_file
        migration_template 'migrations/api_key.rb', 'db/migrate/create_api_keys.rb' rescue nil
	migration_template 'migrations/devise_columns.rb', 'db/migrate/add_devise_columns_to_user.rb' rescue nil
	migration_template 'migrations/enumerize.rb', 'db/migrate/add_enumerize_columns_to_user.rb' rescue nil
	migration_template 'migrations/server_info.rb', 'db/migrate/create_server_infos.rb' rescue nil
      end
			
      def copy_locales
	directory 'locales', 'config/locales'				
      end
    end
  end
end
