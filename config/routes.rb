Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :brag_entry
  post "/brag_entry/new" => "brag_entry#create"
  
  root to: "brag_entry#index"
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
