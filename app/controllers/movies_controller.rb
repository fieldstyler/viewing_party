class MoviesController < ApplicationController

  def index
    response = conn.get("/3/movie/top_rated") do |faraday|
      faraday.params["api_key"] = ENV['MOVIE_API_Key']
      faraday.params["sort_by"] = 'popularity.desc'
      faraday.params["page"] = '2'
    end
    j = JSON.parse(response.body, symbolize_names: true)

    require "pry"; binding.pry

    # redirect_to '/movies'
  end

  private

  def conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

end
