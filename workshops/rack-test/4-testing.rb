#
# Implement the app
#

require 'sinatra'
require 'json'
require 'securerandom'

class Authenticator
  USERNAME = 'josh'
  PASSWORD = 'password'

  class << self

    def authenticate(username, password)
      if USERNAME == username && PASSWORD == password
         SecureRandom.hex(16)
       end
    end
  end
end

post '/authenticate' do
  content_type 'application/json'

  if (token = Authenticator.authenticate(params[:username], params[:password]))
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

#
# Test it
#

ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'

module Helpers
private

  def app
    Sinatra::Application
  end

  def body
    JSON.parse(last_response.body)
  end
end

RSpec.configure do |c|
  c.include Rack::Test::Methods
  c.include Helpers
end

shared_context 'an API request' do

  let(:username) {}
  let(:password) {}

  before do
    post('/authenticate', username: username, password: password)
  end

  it 'should return the correct content type' do
    expect(last_response.headers['Content-Type']).to eq('application/json')
  end

end

describe 'examples of Rack::Test being used in RSpec' do

  context 'correct credentials' do
    include_context 'an API request'

    let(:username) { 'josh' }
    let(:password) { 'password' }

    it 'should succeed with the correct authentication credentials' do
      expect(last_response.ok?).to be_truthy
      expect(body['success']).to be_truthy
      expect(body['token'].size).to be(32)
    end

  end

  context 'incorrect credentials' do
    include_context 'an API request'

    let(:username) { 'josh' }
    let(:password) { 'incorrect' }

    it 'should fail with incorrect credentials' do
      expect(last_response.ok?).to be_falsy
      expect(body['success']).to be_falsy
      expect(body['token']).to be_nil
    end

  end

end
