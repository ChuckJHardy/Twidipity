require 'spec_helper'
require './lib/user_contraint'

RSpec.describe UserConstraint, type: :lib do
  describe '.matches?' do
    subject(:match) { described_class.matches?(request) }

    let(:request) { double('ActionDispatch::Request', session: session) }
    let(:session) { { user_id: 1 } }

    it 'returns true' do
      expect(match).to be_truthy
    end

    context 'when session user id does not exist' do
      let(:session) { {} }

      it 'returns false' do
        expect(match).to be_falsy
      end
    end
  end
end
