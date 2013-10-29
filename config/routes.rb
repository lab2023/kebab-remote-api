KebabRemoteApi::Engine.routes.draw do

	devise_for :users

	namespace :api do

		namespace :v1 do
			resources :users, only: [:index], defaults: { format: 'json' }
			resources :sessions, only: [:create, :destroy], defaults: { format: 'json' }
			match "server_info", to: "server_info#get_server_info", via: [:get], defaults: { format: 'json' }
		end

	end

end
