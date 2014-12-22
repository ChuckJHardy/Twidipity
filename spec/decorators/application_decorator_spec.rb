require 'spec_helper'
require './app/decorators/application_decorator'

RSpec.describe ApplicationDecorator, type: :decorator do
  describe '.decorate' do
    subject(:decorator) { described_class.decorate(object) }

    let(:object) { double }

    it 'returns instance' do
      expect(decorator).to be_an_instance_of(described_class)
    end
  end

  describe '.to_proc' do
    subject(:decorator) { [double].map(&described_class).first }

    it 'returns instance' do
      expect(decorator).to be_an_instance_of(described_class)
    end
  end
end
