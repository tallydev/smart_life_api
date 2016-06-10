Rails.application.routes.draw do

  resources :users, only: [:create] do
    collection do
      post :sign_in
    end
  end
end
