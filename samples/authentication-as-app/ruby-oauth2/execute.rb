#!/usr/bin/env ruby

require "rubygems"
require "oauth2"

# Configuring credentials
credentials = File.read(File.expand_path("../../../credentials.txt")).split("\n");
keys = {
  :consumer_key => credentials[0],
  :consumer_secret => credentials[1]
}

client = OAuth2::Client.new(keys[:consumer_key], keys[:consumer_secret], 
                            :site => 'https://api.twitter.com',
                            :token_url => 'oauth2/token')
token = client.client_credentials.get_token

# The request to users/show doesn't depend
# on user context, so it's ok for auth as app
response = token.get('/1.1/users/show.json?screen_name=twitter')
puts response.body
