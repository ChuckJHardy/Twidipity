require './lib/user_contraint'

Rails.application.routes.draw do
  resources :invite, only: [:index]
  resources :statements, except: [:new]
  resources :users, only: [:destroy]

  get '/history' => 'statements#history'

  get '/auth/twitter/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/logout' => 'sessions#destroy'

  get '/',
    to: 'statements#index',
    constraints: UserConstraint,
    as: :statement_root

  root to: 'statements#index'
end
