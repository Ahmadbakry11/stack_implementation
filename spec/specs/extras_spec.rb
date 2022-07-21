require 'spec_helper'
require_relative '../../extras'

RSpec.describe 'Extras' do
  let!(:extras) { Extras.new(5) }
  let!(:numbers) { [2, 4, 5, 6, 8] }

  describe 'Initializing a new Extras' do
    it 'creates a new extras with mas size 5' do
      expect(extras.max_size).to eq(5)
    end

    it 'creates an empty extras' do
      expect(extras.size).to eq(0)
    end

    it 'raises underflow error when trying to pop an empty extras' do
      expect{ extras.pop }.to raise_error(Stack::UnderflowError)
    end
  end

  describe '#mean' do
    before(:each) { numbers.each { |n| extras.push(n) } }

    it 'pops the peek of the extras' do
      expect(extras.pop).to eq(8)
    end

    it 'tracks the maximum of the extras' do
      extras.pop
      expect(extras.max).to eq(6)
    end

    it 'changes the mean after popping from the extras' do
      expect{ extras.pop }.to change { extras.mean }.from(5).to(4.25)
    end
  end
end