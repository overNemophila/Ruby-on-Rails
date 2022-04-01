Rails.application.routes.draw do
  devise_for :shop_administrators, controllers: {
    :confirmations => 'shop_administrators/confirmations',
    :registrations => 'shop_administrators/registrations',
    :sessions => 'shop_administrators/sessions',
    :passwords => 'shop_administrators/passwords',
  }
  devise_for :users, controllers: {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :omniauth_callbacks => 'users/omniauth_callbacks',
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :deposits, only: [:index, :new] do |variable|
    get :history, on: :collection
  end

  root to: 'home#index'
  resources :payment, only: [:new, :create]

  namespace :shop do
    get '/', to: 'home#index'

    resources :deposit_patterns
    resources :deposits
    resources :usages
  end
end
