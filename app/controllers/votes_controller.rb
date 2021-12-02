class VotesController < ApplicationController
  def create
    new_vote = Vote.new(suggestion_id: params[:suggestion_id], user_id: current_user.id)
    new_vote.save!
    redirect_to trip_day_path(trip_id:params[:trip_id], id: params[:day_id])
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy!
    redirect_to trip_day_path(trip_id:params[:trip_id], id: params[:day_id])
  end
end
