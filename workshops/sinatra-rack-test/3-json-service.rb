require 'sinatra'
require 'json'

class Authenticator
  USERNAME = 'josh'
  PASSWORD = 'password'

  class << self

    def authenticate(username, password)
      USERNAME == username &&
      PASSWORD == password
    end

  end
end

post '/authenticate' do
  if Authenticator.authenticate(params[:username], params[:password])
    response = {
      success: true,
      token: SecureRandom.hex(16)
    }
  else
    response = {
      success: false,
      token: nil
    }

    status 401
  end

  JSON.generate(response)
end
