class Organism
  def initialize(options)
    @iconic_taxon = options.fetch(:iconic_taxon)
    @taxon = options.fetch(:taxon)
  end

  def english_name
    if @taxon[:common_name] != nil
      common = @taxon[:common_name]
      return common[:name] unless nil
    end
  end

  def taxon_name
    return @taxon[:name] unless nil
  end

  def taxon_rank
    return @taxon[:rank] unless nil
  end

  def iconic_taxon_name
    return @iconic_taxon[:name] unless nil
  end

  def iconic_taxon_rank
    return @iconic_taxon[:rank] unless nil
  end
end
