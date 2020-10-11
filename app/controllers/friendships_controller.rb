class FriendshipsController < ApplicationController
  def create
    if User.find_by(email: params[:email]) == nil
      redirect_to '/dashboard'
      flash[:error] = "User does not exist"
    else
      friend = User.find_by(email: params[:email])
      Friendship.create(user_id: current_user.id, friend_id: friend.id)
      redirect_to '/dashboard'
    end 
  end
end
