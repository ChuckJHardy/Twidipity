require 'spec_helper'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'vcr'
require 'webmock/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!

  secrets_to_filter = Rails.application.secrets.select do |_, value|
    value.is_a?(String) || value.is_a?(Numeric)
  end

  secrets_to_filter.each do |key, value|
    c.filter_sensitive_data("<#{key.upcase}>") { value }
  end
end
