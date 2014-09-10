#!/usr/bin/env ruby

require "rubygems"
require "twitter"

if ARGV.size != 1
  puts "Usage: ./execute.rb SCREEN_NAME"
  puts "Example: ./execute.rb TwitterDev"
  exit
end

# Configuring credentials
credentials = File.read(File.expand_path("../../../credentials.txt")).split("\n");
keys = {
  :consumer_key => credentials[0],
  :consumer_secret => credentials[1],
  :token => credentials[2],
  :token_secret => credentials[3] 
}

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = keys[:consumer_key]
  config.consumer_secret     = keys[:consumer_secret]
  config.access_token        = keys[:token]
  config.access_token_secret = keys[:token_secret]
end

user = client.user(ARGV[0])
puts user.to_h.to_json

