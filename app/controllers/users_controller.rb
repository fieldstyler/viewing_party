class UsersController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:password] == params[:password_confirmation] && @user.save
      session[:user_id] = @user.id
      flash[:success] = 'You are now registered and logged in!'
      redirect_to '/dashboard'
    elsif params[:password] != params[:password_confirmation]
      flash[:alert] = 'Passwords do not match!'
      render :new
    else
      flash.now[:alert] = @user.errors.full_messages.first
      render :new
    end
  end

  def show
    @user = current_user
    @parties = @user.find_viewing_parties
    @movies = @user.find_movies
    render file: '/public/404' unless current_user
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
