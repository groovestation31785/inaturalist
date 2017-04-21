require 'rubygems'
require 'rest-client'
require 'json'

# All of these endpoints should use https://www.inaturalist.org as the base URL, particularly endpoints that require auth.

get '/' do
  response = RestClient.get("https://www.inaturalist.org/observations.json")
  parsed_response = JSON.parse(response,:symbolize_names => true)

  @organisms = list_organisms(parsed_response)
  @iconic_taxon_names = sort_taxon(@organisms)

  erb :index
end

private

  def list_organisms(json_response)
    organisms = []
    json_response.each do |organism_hash|
      if organism_hash[:taxon] != nil
        if organism_hash[:iconic_taxon] != nil
          organisms << Organism.new(organism_hash)
        end
      end
    end
    organisms
  end


  def sort_taxon(organisms)
    iconic_taxon_names = ["Plantae", "Animalia", "Mollusca", "Reptilia", "Aves", "Amphibia", "Actinopterygii", "Mammalia", "Insecta", "Arachnida", "Fungi", "Protozoa", "Chromista", "Unknown"]

    iconic_taxon_names.size.times do |name|
      iconic_taxon_names[name] = organisms.select { |org| org.iconic_taxon_name == iconic_taxon_names[name] }
    end
    iconic_taxon_names
  end
