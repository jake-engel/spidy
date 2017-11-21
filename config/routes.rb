Rails.application.routes.draw do

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated do
    root to: 'freelancers#index'
  end
  root to: 'pages#home'

  resources :profiles, only: [ :show, :edit, :update ]

  resources :freelancers, only: [ :index ] do
    resources :offers, only: [ :new, :create, :update ]
  end

  namespace :profile do
    resources :offers, only: [ :index, :update, :destroy ] do
      resources :messages, only: [ :index, :create, :update, :destroy ]

      member do
        patch 'accept'
        patch 'decline'
        patch 'pending'
      end
    end
  end
end
