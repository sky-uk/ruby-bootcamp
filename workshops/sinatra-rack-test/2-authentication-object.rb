# Note: Really what this would be doing is
# looking a user up and performing a password
# comparison, but for testing purposes we're
# making this a lot simpler.

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

Authenticator.authenticate('josh', 'password')
