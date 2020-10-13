class MoviesController < ApplicationController

  def top_40
    @movies = MovieService.top_rated_movies(40)
  end

  def index
    @movies = MovieService.get_movies_by_keyword_search(40, params[:keyword])
  end

  def show
    @movie = MovieService.movie_details(params[:id])
    @crew = MovieService.movie_cast(params[:id])
    @reviews = MovieService.movie_reviews(params[:id])
    @review_count = @reviews.size
  end

end
