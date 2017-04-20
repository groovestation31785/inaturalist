require 'rubygems'
require 'rest-client'
require 'json'

# All of these endpoints should use https://www.inaturalist.org as the base URL, particularly endpoints that require auth.

get '/' do
  response = RestClient.get("https://www.inaturalist.org/observations.json")
  parsed_response = JSON.parse(response,:symbolize_names => true)

  # organism_options = {}
  parsed_response.each do |organism_hash|
    if organism_hash[:taxon] != nil
      p "TAXON"
      p organism_hash.fetch(:taxon)
    end
    if organism_hash[:iconic_taxon] != nil
      p "ICONIC"
      p organism_hash.fetch(:iconic_taxon)
    end
  end

  erb :index
end
