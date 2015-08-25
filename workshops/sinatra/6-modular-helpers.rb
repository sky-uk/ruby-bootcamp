require 'sinatra'

module GreetingsHelpers

  def greeting(id)
    {
      1 => 'hello',
      2 => 'Good day'
    }[id]
  end

end

helpers GreetingsHelpers

get '/greetings/:id' do
  greeting(params[:id].to_i)
end
