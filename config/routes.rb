Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  get '/users', to: 'users#index', as: :homepage
  authenticated :user do
    root to: 'users#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new", as: :sign_in_root
  end
end
