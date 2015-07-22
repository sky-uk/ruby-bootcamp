require 'sinatra'
require 'json'

class Authenticator
  USERNAME = 'josh'
  PASSWORD = 'password'

  class << self

    def authenticate(username, password)
      if USERNAME == username && PASSWORD == password
        SecureRandom.hex(16) # Or other token generation logic
      end
    end

  end
end

post '/authenticate' do
  if token = Authenticator.authenticate(params[:username], params[:password])
    response = {
      success: true,
      token: token
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
