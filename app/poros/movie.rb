class Movie
  attr_reader :title, :vote_average, :genres, :runtime, :overview, :id
  def initialize(attr)
    @title        = attr[:title]
    @vote_average = attr[:vote_average]
    @genres       = attr[:genres]
    @runtime      = attr[:runtime]
    @overview     = attr[:overview]
    @id           = attr[:id]
  end
end
