#!/usr/bin/env ruby

require "rubygems"
require "net/https"
require "simple_oauth"

# Configurating credentials
credentials = File.read(File.expand_path("../../../credentials.txt")).split("\n");
keys = {
  :consumer_key => credentials[0],
  :consumer_secret => credentials[1],
  :token => credentials[2],
  :token_secret => credentials[3] 
}

# Building the request. net/https is being used, 
# but you can choose any other HTTP client lib.
uri          = URI.parse("https://api.twitter.com/1.1/account/verify_credentials.json")
http         = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
req          = Net::HTTP::Get.new(uri.request_uri)
req["Host"]  = "api.twitter.com"

# Generating the OAuth signature from method, 
# uri, parameters and api keys
req["Authorization"] = SimpleOAuth::Header.new(:get, uri.to_s, {}, keys)

response = http.request(req)
puts response.body 

