require 'rails_helper'

describe TwitterClient do
  subject(:service) { described_class.call(user_id: user_id) }

  let(:user_id) { nil }
  let(:secrets) do
    double(
      'ActiveSupport::OrderedOptions',
      twitter_app_key: '1',
      twitter_app_secret: '2'
    )
  end

  before do
    allow(Rails).to receive_message_chain(:application, :secrets)
      .and_return(secrets)
  end

  it 'returns Twitter Client object' do
    expect(service).to be_an_instance_of(Twitter::REST::Client)
  end

  it 'sets consumer key' do
    expect(service.consumer_key).to eq('1')
  end

  it 'sets consumer secrets' do
    expect(service.consumer_secret).to eq('2')
  end

  context 'when user id' do
    let(:user_id) { 44 }
    let(:user) { double('User', token: '123', secret: '456') }

    before do
      allow(User).to receive(:find).with(user_id) { user }
    end

    it 'sets user access token' do
      expect(service.access_token).to eq('123')
    end

    it 'sets user access secret' do
      expect(service.access_token_secret).to eq('456')
    end
  end
end
