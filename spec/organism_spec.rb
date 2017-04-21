require 'spec_helper'

describe Organism do
  let(:options) { { :iconic_taxon => {:name => "Mammalia", :rank => "class"},
                    :taxon => {:name => "Arctocephalus pusillus",
                              :rank => "species",
                              :common_name => { :name => "Brown Fur Seal" }}} }
  let(:organism) { Organism.new( options )}

  it 'accepts a options hash as its parameters' do
    expect(options).to be_a Hash
  end

  it 'has a name that is colloquially known' do
    expect(organism.english_name).to eq "Brown Fur Seal"
  end

  it 'has a taxon name' do
    expect(organism.taxon_name).to eq "Arctocephalus pusillus"
  end

  it 'has a taxon rank' do
    expect(organism.taxon_rank).to eq "species"
  end

  it 'has an iconic taxon name' do
    expect(organism.iconic_taxon_name).to eq "Mammalia"
  end

  it 'has an iconic taxon rank' do
    expect(organism.iconic_taxon_rank).to eq "class"
  end

end
