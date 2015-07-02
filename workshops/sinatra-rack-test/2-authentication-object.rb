# Note: Really what this would be doing is
# looking a user up and performing a password
# comparison, but for testing purposes we're
# making this a lot simpler.

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

if token = Authenticator.authenticate('josh', 'password')
  puts "You're authenticated! Your token is #{token}."
else
  puts "Not authorized."
end
