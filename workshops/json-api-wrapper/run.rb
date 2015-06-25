api = Client.new('jsontest.com')

puts "IP:", api.ip
puts "Date:", api.date
puts "MD5:", api.md5(text: 'foo')

puts api.respond_to?(:ip)
puts api.respond_to?(:date)
puts api.respond_to?(:method_that_isnt_supported)
