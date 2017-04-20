require 'rubygems'
require 'rest-client'
require 'json'

# All of these endpoints should use https://www.inaturalist.org as the base URL, particularly endpoints that require auth.

get '/' do
  erb :index
end

post '/results' do
  response = RestClient.get("https://www.inaturalist.org/observations.json?q=#{params['query']}")
  parsed_response = JSON.parse(response,:symbolize_names => true)
  p params
  puts "**********************************"
  parsed_response.each do |hash|
    puts hash[:taxon]
    puts hash[:iconic_taxon]
  end
  redirect '/'
end
