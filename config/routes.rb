require './lib/beta_user_contraint'

Rails.application.routes.draw do
  resources :invite, only: [:index, :new, :create]
  resources :statements

  get '/auth/twitter/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/',
    to: 'statements#new',
    constraints: BetaUserConstraint,
    as: :new_statement_root

  root to: 'invite#index'
end
