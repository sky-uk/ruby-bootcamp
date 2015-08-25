require 'sinatra'

configure :development do
  set :downstream_system, 'http://development.downstream.com'
end

configure :production do
  set :downstream_system, 'http://production.downstream.com'
end

get '/' do
  "The downstream system is: #{settings.downstream_system}"
end
