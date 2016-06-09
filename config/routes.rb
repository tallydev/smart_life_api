# == Route Map
#
#  Prefix Verb URI Pattern        Controller#Action
# banners GET  /banners(.:format) banners#index
#

Rails.application.routes.draw do

  # Banners routes
  resources :banners, only: [:index]

end
