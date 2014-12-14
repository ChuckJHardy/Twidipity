require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe FollowWorker, type: :worker do
  subject(:worker) do
    described_class.perform_async(statement.id, statement.follow)
  end

  let!(:statement) { create(:statement_with_suggestions) }

  before { Sidekiq::Testing.inline! }

  it 'calls TwilioService with Reservation' do
    expect(TwitterFollow).to receive(:call)
      .with(statement_id: statement.id, quantity: statement.follow)

    worker
  end
end

RSpec.describe FollowWorker::Scheduled, type: :worker do
  subject(:worker) { described_class.perform }

  let!(:statement) do
    create(:statement_with_suggestions, suggestions_ending_at: ending_at)
  end

  let(:ending_at) { DateTime.now - 3.days }

  before do
    expect(FollowWorker).to receive(:perform_async)
      .with(statement.id + 1, statement.follow)

    expect(UnfollowWorker).to receive(:perform_async).with(statement.id)
  end

  it 'sets current statement to inactive' do
    worker
    expect(Statement.first.status).to eq('inactive')
  end

  it 'creates a new statement' do
    worker
    expect(Statement.count).to eq(2)
  end

  it 'sets the new statement ending at to nil' do
    worker
    expect(Statement.last.ending_at).to be_nil
  end
end
