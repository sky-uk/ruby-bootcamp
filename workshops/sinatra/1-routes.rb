require 'sinatra'

get '/greeting' do
  'hello'
end

post '/greeting' do
  'data added'
end

put '/greeting' do
  'data overwritten'
end
