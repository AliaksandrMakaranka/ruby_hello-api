require_relative 'spec_helper'

RSpec.describe 'Hello API' do
  describe 'GET /' do
    it 'returns welcome message' do
      get '/'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to include('message' => 'Welcome to Hello API!')
    end
  end

  describe 'GET /health' do
    it 'returns health status' do
      get '/health'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to include('status' => 'ok')
    end
  end

  describe 'GET /api/messages' do
    it 'returns default message' do
      get '/api/messages'
      expect(last_response).to be_ok
      response = JSON.parse(last_response.body)
      expect(response).to include('content', 'language', 'timestamp')
      expect(response['content']).to eq('hello world from ruby with love')
    end
  end

  describe 'GET /api/messages/:language' do
    it 'returns translated message' do
      get '/api/messages/es'
      expect(last_response).to be_ok
      response = JSON.parse(last_response.body)
      expect(response['content']).to eq('hola mundo desde ruby con amor')
      expect(response['language']).to eq('es')
    end
  end

  describe 'POST /api/messages' do
    it 'creates a new message' do
      post '/api/messages', 
           { content: 'test message', language: 'en' }.to_json,
           { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response).to be_ok
      response = JSON.parse(last_response.body)
      expect(response['content']).to eq('test message')
      expect(response['language']).to eq('en')
    end
  end
end

RSpec.describe MessageService do
  describe '.get_default_message' do
    it 'returns default message' do
      message = described_class.get_default_message
      expect(message.content).to eq('hello world from ruby with love')
      expect(message.language).to eq('en')
    end
  end

  describe '.get_translated_message' do
    it 'returns translated message' do
      message = described_class.get_translated_message('es')
      expect(message.content).to eq('hola mundo desde ruby con amor')
      expect(message.language).to eq('es')
    end
  end

  describe '.create_message' do
    it 'creates a new message' do
      message = described_class.create_message('test message', 'en')
      expect(message.content).to eq('test message')
      expect(message.language).to eq('en')
    end
  end
end 