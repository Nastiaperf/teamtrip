class DaysController < ApplicationController
  def index
    #days of the trip page

    @trip = Trip.find(params[:trip_id])
    @calendar_days = @trip.days
    if params[:date].present?
      @trip_days = @trip.days.where(date: params[:date])
      @selected_date = params[:date]
    else
      @trip_days = @trip.days
      @selected_date = Day.first.date
    end
    @day = @trip_days.first
    @best_hotels = Suggestion.by_day_and_category_order_by_vote(@day, "Hotel").where.not(latitude: nil, longitude: nil).first(1)
    @best_restaurants = Suggestion.by_day_and_category_order_by_vote(@day, "Restaurant").where.not(latitude: nil, longitude: nil).first(2)
    @best_activities = Suggestion.by_day_and_category_order_by_vote(@day, "Activity").where.not(latitude: nil, longitude: nil).first(3)
    @suggestions = @best_hotels + @best_activities + @best_restaurants

    @markers = @suggestions.map do |suggestion|
      {
        lat: suggestion.latitude,
        lng: suggestion.longitude,
        id: suggestion.id,
        icon: helpers.asset_url("#{suggestion.category}.png"),
        info_window: render_to_string(partial: "info_window", locals: { suggestion: suggestion })
        # infoWindow: { content: render_to_string(partial: "/suggestions/map_box", locals: { suggestion: suggestion }) }
        # Uncomment the above line if you want each of your markers to display a info window when clicked
        # (you will also need to create the partial "/suggestions/map_box")
      }
    end

    #Google Places client instance
    @client = GooglePlaces::Client.new(ENV['GOOGLE_API_BROWSER_KEY'])
    @hotels_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Hotel")
    @restaurants_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Restaurant")
    @activities_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Activity")
  end

  def show

    #details of the suggestions of the day
    @trip = Trip.find(params[:trip_id])
    @trip_days = @trip.days
    @day = Day.find(params[:id])

    @hotels_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Hotel")
    @restaurants_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Restaurant")
    @activities_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Activity")

    # begin calendar
    @current_date = @day || Day.first

    unless @current_date == Day.last
      @next_date = (@current_date.date + 1.day).strftime("%Y-%m-%d")
    end

    unless @current_date == Day.first
      @previous_date = (@current_date.date - 1.day).strftime("%Y-%m-%d")
    end

    @current_date = (@day.date).strftime("%Y-%m-%d")
    # end calendar

  end

  private

  def day_params
    params.require(:day).permit(:date, :trip_id)
  end
end
