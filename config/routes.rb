Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :trips, only: [:new, :create, :show, :update, :index] do
    resources :days, only: [:index, :show]
    resources :trip_members, only: [:new, :create]
    member do
      patch :lock_trip
    end

    namespace :onboarding do
      resources :registrations, only: [:new, :create]
    end
  end

  resources :suggestions, only: [:new, :create, :update]
  resources :votes, only: [:create, :destroy]
end
