Rails.application.routes.draw do
  resources :characters
  resources :users
  resources :stories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
