Rails.application.routes.draw do
  authenticated do
    root to: 'jobs#index'
  end
  root to: 'pages#home'

  devise_for :users

  resources :profiles, only: [ :show, :edit, :update ]

  resources :freelancers, only: [ :index ] do
    resources :offers, only: [ :new, :create, :edit, :update ]
  end

  namespace :profile do
    resources :offers, only: [ :index, :edit, :update, :destroy ] do
      resources :messages, only: [ :index, :create, :update, :destroy ]

      member do
        patch 'accept'
        patch 'decline'
        patch 'pending'
      end
    end
  end
end
