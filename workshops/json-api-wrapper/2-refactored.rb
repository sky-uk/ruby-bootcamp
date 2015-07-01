require 'net/http'
require 'json'

class Client
  attr_reader :host

  def initialize(host)
    @host = host
  end

  def ip
    fetch('ip')
  end

  def date
    fetch('date')
  end

  def md5(text = nil)
    fetch('md5', text: text)
  end

private

  def fetch(subdomain, params = {})
    uri = URI("http://#{subdomain}.#{host}/")
    uri.query = URI.encode_www_form(params) unless params.empty?
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    data.fetch(subdomain)
  end
end

require_relative 'run'
