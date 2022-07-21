require 'spec_helper'
require_relative '../../stack'

RSpec.describe 'Stack' do
  let!(:stack) { Stack.new(5) }
  let!(:numbers) { [2, 4, 5, 6, 8] }

  describe 'Initializing a new stack' do
    it 'creates a new stack with mas size 5' do
      expect(stack.max_size).to eq(5)
    end

    it 'creates an empty stack' do
      expect(stack.size).to eq(0)
    end

    it 'raises underflow error when trying to pop an empty stack' do
      expect{ stack.pop }.to raise_error(Stack::UnderflowError)
    end
  end

  describe 'pushing to the stack' do
    before(:each) { numbers.each { |n| stack.push(n) } }
  
    it 'pushes 5 elements to the stack' do
      expect(stack.size).to eq(5)
    end

    it 'keeps last pushed element on top of the stack' do
      expect(stack.peek).to eq(8)
    end

    it 'it tracks the maximum value' do
      expect(stack.max).to eq(8)
    end

    it 'returns the correct avg' do
      expect(stack.avg).to eq(5)
    end

    it 'raises an overflow error when you exceed the stack limit' do
      expect{ stack.push(10) }.to raise_error(Stack::OverflowError)
    end
  end

  describe 'poping from the stack' do
    before(:each) { numbers.each { |n| stack.push(n) } }

    it 'pops the peek of the stack' do
      expect(stack.pop).to eq(8)
    end

    it 'tracks the maximum of the stack' do
      stack.pop
      expect(stack.max).to eq(6)
    end

    it 'changes the average after popping from the stack' do
      expect{ stack.pop }.to change { stack.avg }.from(5).to(4.25)
    end

    it 'raises underflow error when trying to pop an empty stack' do
      numbers.size.times { stack.pop }
      expect{ stack.pop }.to raise_error(Stack::UnderflowError)
    end
  end
end