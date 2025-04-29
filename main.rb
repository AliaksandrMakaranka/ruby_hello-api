require 'sinatra'

get '/hello' do
  content_type :json
  { message: 'hello world from ruby with love' }.to_json
end

get '/str/' do
  "hello world from ruby with love"
end