class MoviesController < ApplicationController

  def index

    conn = Faraday.new(url: "https://api.themoviedb.org/3/discover/movie?api_key=371b8a717e3be7bf5d224b713e72fae7&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1-2") do |faraday|
      faraday.headers["MOVIEDB-API-Key"] = ENV['MOVIE_API_Key']
    end
    require "pry"; binding.pry
    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    redirect_to '/movies'
  end

end
