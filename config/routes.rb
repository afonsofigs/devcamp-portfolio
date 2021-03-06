Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'log_out', sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # the "about" is just whats in the link bar
  get 'about-me', to: "pages#about"
  get 'contact', to: "pages#contact"

  resources :blogs do 
    member do 
      get :toggle_status
    end
  end 

  root to: 'pages#home'
end
