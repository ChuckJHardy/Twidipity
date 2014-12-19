require 'rails_helper'

describe TwitterUsersToFollow do
  subject(:service) { described_class.call(client: client, quantity: 2) }

  let(:client) do
    instance_double('Twitter::REST::Client', current_user: current_user)
  end

  let(:current_user) { instance_double('Twitter::User') }
  let(:user) { instance_double('Twitter::User') }

  let!(:suggestion) { create(:suggestion) }

  before do
    expect(client).to receive(:users).with([suggestion.tuid]) { [user] }
  end

  context 'when already friends' do
    it 'returns collection' do
      expect(client).to receive(:friendship?)
        .with(current_user, user) { true }

      expect(service).to eq([])
    end
  end

  context 'when not friends' do
    it 'returns collection of users' do
      expect(client).to receive(:friendship?)
        .with(current_user, user) { false }

      expect(service).to eq([user])
    end
  end
end
