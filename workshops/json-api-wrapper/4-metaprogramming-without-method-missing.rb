require 'net/http'
require 'json'

class Client
  attr_reader :host

  SUPPORTED_SUBDOMAINS = %w( ip date md5 )

  def initialize(host = nil)
    @host = host
  end

  SUPPORTED_SUBDOMAINS.each do |name|

    define_method(name) do |params = {}|
      uri = URI("http://#{name}.#{host}/")
      uri.query = URI.encode_www_form(params) unless params.empty?
      response = Net::HTTP.get_response(uri)
      parsed = JSON.parse(response.body)
      parsed[name]
    end

  end
end

require_relative 'run'
