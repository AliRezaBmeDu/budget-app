Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  get '/categories', to: 'categories#index', as: :homepage

  resources :users, only: [:show, :edit, :update]
  resources :buys
  resources :categories

  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new", as: :sign_in_root
  end
  
end
