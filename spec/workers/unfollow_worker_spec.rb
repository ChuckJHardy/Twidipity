require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe UnfollowWorker, type: :worker do
  subject(:worker) do
    described_class.perform_async(statement.id)
  end

  let!(:statement) { create(:statement_with_suggestion) }

  before { Sidekiq::Testing.inline! }

  it 'calls TwilioService with Reservation' do
    expect(TwitterUnfollow).to receive(:call)
      .with(statement_id: statement.id)

    worker
  end
end
