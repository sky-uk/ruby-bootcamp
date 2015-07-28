require 'sinatra'
require 'json'

get '/' do
  "Hello world"
end

get '/unauthorized' do
  status 401
  "Not authorised"
end

get '/data.json' do
  content_type 'application/json'
  JSON.generate({ some: 'data' })
end
