Rails.application.routes.draw do

  devise_for :users
  resources :banners, only: [:index]
  resource :home, only: [:show]

end
