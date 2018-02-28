Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # the "about" is just whats in the link bar
  get 'about-me', to: "pages#about"
  get 'contact', to: "pages#contact"

  resources :blogs

  root to: 'pages#home'
end
