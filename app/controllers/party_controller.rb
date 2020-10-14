class PartyController < ApplicationController

  def new
    @movie = MovieService.movie_details(params[:id])
  end

  def create
    party = Party.new(party_params)
    if party.save
      PartyViewer.create(party_id: party.id, user_id: current_user.id, status: "host")
      params[:friend_id].each do |friend_id|
        PartyViewer.create(party_id: party.id, user_id: friend_id.to_i, status: 'invited')
      end
      flash[:success] = 'Viewing Party Created!'
      redirect_to '/dashboard'
    else
      flash.now[:alert] = party.errors.full_messages.first
      render :new
    end
  end

  private

  def party_params
    params.permit(:movie, :duration, :party_date, :start_time)
  end
end
