Rails.application.routes.draw do
  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/:provider/logout', to: 'sessions#destroy'
end
