Devise.setup do |config|
  config.router_name = :kebab_remote_api
  config.parent_controller = 'ActionController::Base'
end