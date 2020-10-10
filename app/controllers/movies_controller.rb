class MoviesController < ApplicationController

  def index
    @movies = get_top_rated_movies(40)
  end

  def show
    @movies = get_movies_by_keyword_search(40)
  end

  def get_top_rated_movies(movie_count_limit)
    page=1
    results = []
    until results.length >= movie_count_limit
      response = conn.get("/3/movie/top_rated") do |faraday|
        faraday.params["api_key"] = ENV['MOVIE_API_Key']
        faraday.params['page'] = page
      end
      j = JSON.parse(response.body, symbolize_names: true)
      j[:results].each do |movie|
        results << movie
      end
      page += 1
    end
    return results
  end

  def get_movies_by_keyword_search(movie_count_limit)
    page=1
    results = []
    until results.length >= movie_count_limit
      response = conn.get("/3/search/movie") do |faraday|
        faraday.params["api_key"] = ENV['MOVIE_API_Key']
        faraday.params["query"] = params[:keyword]
        faraday.params['page'] = page
      end
      j = JSON.parse(response.body, symbolize_names: true)
      j[:results].each do |movie|
        results << movie
      end
      page += 1
    end
    return results
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

end
