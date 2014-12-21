require './lib/user_contraint'

Rails.application.routes.draw do
  resources :invite, only: [:index]
  resources :statements
  resources :users, only: [:destroy]

  get '/auth/twitter/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/logout' => 'sessions#destroy'

  get '/',
    to: 'statements#index',
    constraints: UserConstraint,
    as: :statement_root

  root to: 'statements#new'
end
