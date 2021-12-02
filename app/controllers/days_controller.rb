class DaysController < ApplicationController
  def index
    #days of the trip page

    @trip = Trip.find(params[:trip_id])
    @trip_days = @trip.days
    @day = @trip_days.first

    @suggestions = Suggestion.where.not(latitude: nil, longitude: nil)
    @markers = @suggestions.map do |suggestion|
      {
        lat: suggestion.latitude,
        lng: suggestion.longitude,
        # infoWindow: { content: render_to_string(partial: "/suggestions/map_box", locals: { suggestion: suggestion }) }
        # Uncomment the above line if you want each of your markers to display a info window when clicked
        # (you will also need to create the partial "/suggestions/map_box")
      }
    end

  end

  def show
    #details of the suggestions of the day
    trip = Trip.find(params[:trip_id])
    @trip_days = trip.days
    @day = Day.find(params[:id])
  end

private

  def day_params
    params.require(:day).permit(:date, :trip_id)
  end

end
