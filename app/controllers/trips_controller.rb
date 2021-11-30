class TripsController < ApplicationController
  def new
  end

  def create
    @trip = Trip.new(params[:trip])
    @trip.save
  end

  def show
  end

  def update
  end

end
