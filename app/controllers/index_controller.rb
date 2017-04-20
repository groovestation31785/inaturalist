require 'rubygems'
require 'rest-client'
require 'json'

# All of these endpoints should use https://www.inaturalist.org as the base URL, particularly endpoints that require auth.

get '/' do
  p "TAXAAAAAA GET"
  p @taxa
  erb :index
end

post '/results' do
  url = "https://www.inaturalist.org/observations.json?q=#{params['q']}"
  response = RestClient.get(url)
  parsed_response = JSON.parse(response,:symbolize_names => true)

  @taxa = []
  parsed_response.each do |creature_hash|
    @taxa << creature_hash[:taxon]
  end

  p "TAXAAAAA POST"
  p @taxa.length
  

  redirect '/'
end
