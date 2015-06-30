require 'sinatra'

get '/' do
  "Hello world"
end

get '/unauthorized' do
  status 401
  "Not authorised"
end

get '/data.json' do
  JSON.generate({ some: 'data' })
end
