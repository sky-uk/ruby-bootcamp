require 'sinatra'

class ModularApp < Sinatra::Base

  get '/' do
    'hello world'
  end

end
