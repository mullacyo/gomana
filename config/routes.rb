Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin', :constraints => AdminConstraint.new
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :outings do 
    resources :actions
  end
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
