require 'rubygems'
require 'rest-client'
require 'json'

# All of these endpoints should use https://www.inaturalist.org as the base URL, particularly endpoints that require auth.

base_url = "https://www.inaturalist.org"

get '/' do
  response = RestClient.get("#{base_url}/observations.json")
  parsed_response = JSON.parse(response,:symbolize_names => true)
  puts parsed_response

  erb :index
end
