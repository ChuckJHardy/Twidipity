require 'rails_helper'

RSpec.describe KeenAdapter do
  let(:instance) { described_class.new }

  before do
    allow(Rails).to receive_message_chain(:env, :production?) { true }
  end

  describe '.friend' do
    subject(:friend) do
      described_class.friend(suggestion: suggestion, key: :follow)
    end

    let(:options) { { tuid: 123, screen_name: '@Test', slug: 'news' } }

    let(:suggestion) { double('Suggestion', options) }

    it 'calls off to keen' do
      expect(Keen).to receive(:publish).with(:follow, options)
      friend
    end
  end

  describe '#user' do
    subject(:user) { instance.user(mock_user) }

    let(:options) { { name: 'Test', location: 'TestLand' } }
    let(:mock_user) { double('User', options) }

    it 'returns User object' do
      expect(user).to be_an_instance_of(KeenAdapter::User)
    end

    describe '#create' do
      it 'calls off to keen' do
        expect(Keen).to receive(:publish)
          .with(:new_session, options)

        user.create
      end
    end

    describe '#destroy' do
      it 'calls off to keen' do
        expect(Keen).to receive(:publish)
          .with(:destroy_user, options)

        user.destroy
      end
    end
  end
end
