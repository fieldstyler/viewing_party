class MovieService
  def self.top_rated_movies(movie_count_limit)
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
    results
  end

  def self.movie_cast(movie_id)
    cast = []
    act_response = conn.get("3/movie/#{movie_id}/credits") do |faraday|
      faraday.params["api_key"] = ENV['MOVIE_API_Key']
    end
    response = JSON.parse(act_response.body, symbolize_names: true)
    if response[:cast].count > 10
      until cast.count == 10
        response[:cast].each do |cast_data|
          cast << Actor.new(cast_data)
          break if cast.count == 10
        end
      end
    else
      response[:cast].each do |cast_data|
        cast << Actor.new(cast_data)
      end
    end
    cast
  end

  def self.get_movies_by_keyword_search(movie_count_limit, keyword)
    page=1
    results = []
    until results.length >= movie_count_limit
      response = conn.get('/3/search/movie') do |faraday|
        faraday.params['api_key'] = ENV['MOVIE_API_Key']
        faraday.params['query'] = keyword
        faraday.params['page'] = page
      end
      j = JSON.parse(response.body, symbolize_names: true)
      j[:results].each do |movie|
        results << movie
      end
      page += 1
    end
    results
  end

  def self.movie_details(movie_id)
    # binding.pry
    response = conn.get("3/movie/#{movie_id}") do |faraday|
      faraday.params["api_key"] = ENV['MOVIE_API_Key']
    end
    movie = JSON.parse(response.body, symbolize_names: true)
    Movie.new(movie)
  end

  def self.movie_reviews(movie_id)
    reviews = []
    act_response = conn.get("3/movie/#{movie_id}/reviews") do |faraday|
      faraday.params["api_key"] = ENV['MOVIE_API_Key']
    end
    response = JSON.parse(act_response.body, symbolize_names: true)
    response[:results].each do |review_data|
      reviews << Review.new(review_data)
    end
    reviews
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

end
