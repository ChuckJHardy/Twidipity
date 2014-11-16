require 'rails_helper'

describe SubscribeWithEmailOrTwitter do
  subject do
    described_class.call controller: controller, email: email, twitter: twitter
  end

  let(:controller) do
    double(
      'TestController',
      root_path: '/',
      params: { address: address }
    )
  end

  let(:email) { double('SubscribeWithEmail') }
  let(:twitter) { double('SubscribeWithTwitter') }

  context 'when Email Subscription' do
    let(:address) { 'twidipity+test@insert.coffee' }

    it 'calls email service' do
      expect(email).to receive(:call)
        .with(address: address, controller: controller) { true }
      expect(subject).to be_truthy
    end
  end

  context 'when Twitter Subscription' do
    before do
      expect(twitter).to receive(:call)
        .with(address: address, controller: controller) { true }
    end
    context 'with @' do
      let(:address) { '@TestTwitterHandle' }

      it 'calls twitter service' do
        expect(subject).to be_truthy
      end
    end

    context 'without @' do
      let(:address) { 'TestTwitterHandle' }

      it 'calls twitter service' do
        expect(subject).to be_truthy
      end
    end
  end

  context 'when Unknown Subscription' do
    let(:address) { 'twidipity+test@' }

    it 'calls null service' do
      allow(email).to receive(:call)
        .with(address: address, controller: controller)

      expect(controller).to receive(:redirect_to)
        .with('/', notice: ':(') { true }

      expect(subject).to be_truthy
    end
  end
end
