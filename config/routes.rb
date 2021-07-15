Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users
  devise_for :views
  
  # devise_for :users, skip: [:sessions], controllers: { omniauth_callbacks: 'omniauth_callbacks' }
end
