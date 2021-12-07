class VotesController < ApplicationController
  before_action :ensure_trip_is_not_locked

  def create

    new_vote = Vote.new(suggestion_id: params[:suggestion_id], user_id: current_user.id)
    new_vote.save!
    redirect_to trip_day_path(trip_id:params[:trip_id], id: params[:day_id], category: new_vote.suggestion.category)
  end

  def destroy

    vote = Vote.find(params[:id])
    vote.destroy!
    redirect_to trip_day_path(trip_id:params[:trip_id], id: params[:day_id], category: vote.suggestion.category)
  end

  def ensure_trip_is_not_locked
    @trip = Trip.find(params[:trip_id])

    if @trip.locked == true
      flash[:alert] = "User not found."
      return head :no_content
      # flash.alert = "peux pas voter"
    end
  end
end
