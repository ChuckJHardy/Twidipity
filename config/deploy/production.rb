role :app, %w{deployer@178.62.97.46:15816}
role :web, %w{deployer@178.62.97.46:15816}
role :db, %w{deployer@178.62.97.46:15816}

set :port, 15816
set :user, 'deployer'
set :deploy_via, :remote_cache
set :use_sudo, false

server '178.62.97.46',
  roles: [:app, :web, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'deployer',
}

set :rails_env, :production
set :conditionally_migrate, true

# capistrano-sidekiq
set :sidekiq_default_hooks, false
set :sidekiq_config, -> { File.join(shared_path, 'config', 'sidekiq', 'production.yml') }
