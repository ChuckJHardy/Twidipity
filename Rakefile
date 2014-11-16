desc 'run rubocop'
task(:rubocop) do
  require 'rubocop'
  cli = RuboCop::CLI.new
  cli.run
end

task default: [:rubocop, :test]

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
