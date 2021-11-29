Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user, only:[:new, :create]

  resources :trips, only: [:new, :create, :show, :update] do
    resources :days, only: [:index, :show]
  end

  resources :suggestions, only: [:new, :create]
  resources :votes, only: [:create, :destroy]

end
