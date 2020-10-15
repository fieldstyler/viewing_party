require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attr = {
        title: "Dante's Inferno",
        vote_average: 8.4,
        genres: "Drama",
        runtime: 120,
        overview: "A volcano"
    }

    movie = Movie.new(attr)
    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("Dante's Inferno")
    expect(movie.vote_average).to eq(8.4)
    expect(movie.genres).to eq("Drama")
    expect(movie.runtime).to eq(120)
    expect(movie.overview).to eq("A volcano")
  end

end