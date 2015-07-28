require 'sinatra'

get '/greetings/:id' do
  greetings = {1 => 'hello', 2 => 'good day'}

  greeting = greetings[params[:id].to_i]

  params[:shout] ? greeting.upcase : greeting
end

