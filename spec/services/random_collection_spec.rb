require 'rails_helper'

describe RandomCollection do
  subject(:collection) { described_class.pluck(4) }

  it 'returns collection with correct count' do
    expect(collection.size).to eq 4
  end

  it 'returns collection of integers' do
    expect(collection.map(&:class).uniq).to eq [Fixnum]
  end
end
