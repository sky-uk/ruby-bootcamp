require 'sinatra'

helpers do

  def greetings(id)
    {
      1 => 'hello',
      2 => 'good day'
    }[id]
  end

end

get '/greetings/:id' do
  greetings(params[:id].to_i)
end
