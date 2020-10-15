class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend.nil?
      redirect_to '/dashboard'
      flash[:error] = 'User does not exist'
    else
      Friendship.create(user_id: current_user.id, friend_id: friend.id)
      redirect_to '/dashboard'
    end
  end
end
