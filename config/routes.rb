Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  resources :users, only: [:show, :edit, :update]
  resources :buys
  resources :categories

  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "pages#splash", as: :unauthenticated_root
  end

  get '/', to: 'categories#index', as: :homepage
  # get '/buys/new(.format)', to: 'buys#new', as: :new_custom_buy
end
