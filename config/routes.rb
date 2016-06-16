Rails.application.routes.draw do

  devise_for :users
  resources :banners, only: [:index]
  resource :home, only: [:show]

  resources :users, only: [:create] do
    collection do
      post :sign_in
    end
  end
end
