require 'net/http'
require 'json'

class Client
  attr_reader :host

  def initialize(host)
    @host = host
  end

  def ip
    uri = URI("http://ip.#{host}/")
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    data['ip']
  end

  def date
    uri = URI("http://date.#{host}/")
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    data['date']
  end

  def md5(text = nil)
    uri = URI("http://md5.#{host}/")
    uri.query = URI.encode_www_form(text: text)
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    data['md5']
  end

end

require_relative 'run'
