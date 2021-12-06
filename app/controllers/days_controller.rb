class DaysController < ApplicationController
  def index
    #days of the trip page

    @trip = Trip.find(params[:trip_id])
    if params[:date].present?
      @trip_days = @trip.days.where(date: params[:date])
      @selected_date = params[:date]
    else
      @trip_days = @trip.days
      @selected_date = Day.first.date
    end

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
    trip = Trip.find(params[:trip_id])
    @trip_days = trip.days
    @day = Day.find(params[:id])
    @hotels_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Hotel")
    @restaurants_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Restaurant")
    @activities_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Activity")
  end

  private

  def day_params
    params.require(:day).permit(:date, :trip_id)
  end
end
