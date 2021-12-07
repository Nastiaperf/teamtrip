class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.creator_id = current_user.id
    @trip.save!
  end

  def show
    #roadmap page
    @trip        = Trip.find(params[:id])
    @trip_days   = @trip.days.order(:date)
    @current_day = @trip_days.find_by(date: params[:date]) || @trip_days.first

    @current_date = (@current_day.date).strftime("%Y-%m-%d")

    unless @current_day == @trip_days.last
      @next_date = (@current_day.date + 1.day).strftime("%Y-%m-%d")
    end

    unless @current_day == @trip_days.first
      @previous_date = (@current_day.date - 1.day).strftime("%Y-%m-%d")
      @previous_hotel = @trip_days.find_by(date: @previous_date).suggestions.
                          where(category: "Hotel").
                          left_joins(:votes).group(:id).
                          order('COUNT(votes.id) DESC').
                          first
    end

    current_day_suggestions = @trip_days.find_by(date: @current_date).
                                suggestions.
                                left_joins(:votes).group(:id).
                                order('COUNT(votes.id) DESC')

    @current_hotel = current_day_suggestions.
                      where(category: "Hotel").
                      first

    @current_activities = current_day_suggestions.
                          where(category: "Activity").
                          first(3)

    @current_restaurants = current_day_suggestions.
                          where(category: "Restaurant").
                          first(2)
    @current_activities_restaurants = (@current_activities + @current_restaurants).sort_by(&:position)
  end

  def update
    #for trip update (locked, name, dates, etc.)
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :location, :locked)
  end

end
