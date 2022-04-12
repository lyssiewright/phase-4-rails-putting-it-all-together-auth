Rails.application.routes.draw do
  get "/recipes", to: 'recipes#index'
  post "recipes", to: 'recipes#create'
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#delete'
  post "/signup", to: 'users#create'
  get "/me", to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
