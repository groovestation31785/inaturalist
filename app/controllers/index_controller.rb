require 'rubygems'
require 'rest-client'
require 'json'

# All of these endpoints should use https://www.inaturalist.org as the base URL, particularly endpoints that require auth.

get '/' do
  response = RestClient.get("https://www.inaturalist.org/observations.json")
  parsed_response = JSON.parse(response,:symbolize_names => true)

  @organisms = []
  parsed_response.each do |organism_hash|
    if organism_hash[:taxon] != nil
      if organism_hash[:iconic_taxon] != nil
        @organisms << Organism.new(organism_hash)
      end
    end
  end


  @iconic_taxon_names = ["Plantae", "Animalia", "Mollusca", "Reptilia", "Aves", "Amphibia", "Actinopterygii", "Mammalia", "Insecta", "Arachnida", "Fungi", "Protozoa", "Chromista", "Unknown"]

  @iconic_taxon_names.size.times do |name|
    @iconic_taxon_names[name] = @organisms.select { |org| org.iconic_taxon_name == @iconic_taxon_names[name] }
  end

  @organisms
  @iconic_taxon_names


  erb :index
end
