Rails.application.routes.draw do

  mount KebabRemoteApi::Engine => "/kebab_remote_api"
end
