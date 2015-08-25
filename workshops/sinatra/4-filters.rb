require 'sinatra'
require 'json'

before do
  puts "prints every time"
end

before %r[/greetings/\d{1}] do
  puts "only printing when I am supposed to"
end

after do
  puts "finishing up"
end

helpers do

  def greetings
    {
      1 => 'Good Day',
      2 => 'hello'
    }
  end

end

get '/greetings' do
  content_type 'application/json'
  greetings.to_json
end

get '/greetings/:id' do
  greetings[params[:id].to_i]
end
