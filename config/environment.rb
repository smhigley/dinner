# Load the Rails application.
require File.expand_path('../application', __FILE__)

# require the flickr gem
require 'flickraw'
FlickRaw.api_key="5f6652a08b32dd50ae264fb3f47a9632"
FlickRaw.shared_secret="6826da1b61cf3f39"

# Initialize the Rails application.
Dinner::Application.initialize!
