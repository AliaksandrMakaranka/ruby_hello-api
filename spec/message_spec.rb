require_relative 'spec_helper'
require_relative '../app/models/message'

RSpec.describe Message do
  describe '#initialize' do
    it 'creates a message with default language' do
      message = Message.new('Hello')
      expect(message.content).to eq('Hello')
      expect(message.language).to eq('en')
    end

    it 'creates a message with specified language' do
      message = Message.new('Hello', 'es')
      expect(message.language).to eq('es')
    end
  end

  describe '.default' do
    it 'returns a default message' do
      message = Message.default
      expect(message.content).to eq('hello world from ruby with love')
      expect(message.language).to eq('en')
    end
  end

  describe '.translate' do
    it 'translates to Spanish' do
      message = Message.translate('hello', 'es')
      expect(message.content).to eq('hola mundo desde ruby con amor')
      expect(message.language).to eq('es')
    end

    it 'returns original content for unknown language' do
      message = Message.translate('hello', 'unknown')
      expect(message.content).to eq('hello')
      expect(message.language).to eq('unknown')
    end
  end
end 