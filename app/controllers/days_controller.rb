class DaysController < ApplicationController
  def index
    #days of the trip page
    @trip = Trip.find(params[:trip_id])
    @trip_days = @trip.days
    @day = @trip_days.first
  end

  def show
    #details of the suggestions of the day
    @day = Day.find(params[:id])
  end

end
