Rails.application.routes.draw do
  mount KebabRemoteApi::Engine => "/remote"
end
