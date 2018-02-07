Rails.application.routes.draw do
  root "companies#index"
  
  resources :median_subaccounts
  resources :companies
  resources :session, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
