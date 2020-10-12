class Movie
  attr_reader :title, :vote_average, :genres, :runtime, :overview
  def initialize(attr)
    @title        = attr[:title]
    @vote_average = attr[:vote_average]
    @genres       = attr[:genres]
    @runtime      = attr[:runtime]
    @overview     = attr[:overview]
  end
end