class Organism
  def initialize(options)
    @iconic_taxon = options.fetch(:iconic_taxon)
    @taxon = options.fetch(:taxon)
  end

  def english_name
    @taxon[:common_name][:name]
  end

  def taxon_name
    @taxon[:name]
  end

  def taxon_rank
    @taxon[:rank]
  end

  def iconic_taxon_name
    @iconic_taxon[:name]
  end

  def iconic_taxon_rank
    @iconic_taxon[:rank]
  end
end
