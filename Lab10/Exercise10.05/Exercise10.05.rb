require 'net/http'

uri = URI('https://www.fenago.com')

response = Net::HTTP.get_response(uri)
puts response.code
puts response.body
