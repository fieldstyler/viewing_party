class SessionsController < ApplicationController

  # def new
  #   if session[:user_id] != nil
  #     flash[:success] = "You are already logged in."
  #     user = User.find(session[:user_id])
  #   end
  # end


  def create
    user = User.find_by(email: params[:email])
    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

  # def destroy
  #   session[:user_id] = nil
  #   session[:cart] = nil
  #   flash[:success] = "You've successfully logged out."
  #   redirect_to '/'
  # end
end
