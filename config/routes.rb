Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :banners, only: [:index]
  resource :home, only: [:show]

  ############ SMS Routes ###################
  resources :sms_tokens, only: [:show]  do
    collection do
      post 'register'
    end
  end
  ###########################################

  ########### UserInfo Route ################
  resource :user_info, only: [:show, :update] do
    member do
      post 'reset'
    end
  end
  ###########################################

  ########### Sport Route ####
  resources :sports, only: [:create, :show] do
    collection do
      get 'daily'
      get 'weekly'
      get 'monthly'
      get 'yearly'
    end
  end

  # 获取具体的排名，支持分页
  resources :ranks, only: [:show] do
    collection do
      get 'daily'
      get 'weekly'
      get 'monthly'
      get 'yearly'
    end
  end
  ###########################################

  ########### Appointment Route ###########################
  resources :appointments, only: [:show, :create, :index]
  ##########################################################

  ########### Activity Route ###########################
  namespace :activity do
    resources :sqhds, only: [:index, :show]
  end
  ##########################################################
  
  ########### Product Route ###########################
  resources :products, only: [:show, :index] do 
    member do
      post '/products/:id/thumbs', to: 'products#create_thumb'
      delete '/products/:id/thumbs/:thumb_id', to: 'products#destroy_thumb'
    end
  end
  resources :cart_items do
    collection do
      post :pay
    end
  end
  resources :contacts
  ##########################################################

  ################  健康小屋体检机器相关的接口路由   ###################
  # 给体检机器提供的webservice接口
  wash_out :healthy_services

  # 提供APP查询的接口
  resources :reports, only: [:index] do
    collection do
      get ':item', action: :show
    end
  end
  ##########################################################
end
