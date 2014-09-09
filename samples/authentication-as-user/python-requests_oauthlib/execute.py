#!/usr/bin/env python

from requests_oauthlib import OAuth1Session

# Configuring credentials
with open("../../../credentials.txt") as f:
    keys = f.readlines()
keys = [x.strip('\n') for x in keys]

# Building the request
twitter = OAuth1Session(keys[0],
                        client_secret=keys[1],
                        resource_owner_key=keys[2],
                        resource_owner_secret=keys[3])
url = "https://api.twitter.com/1.1/account/verify_credentials.json"

response = twitter.get(url)
print response.json()

