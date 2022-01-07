class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.creator_id = current_user.id
    if @trip.save!
      redirect_to trip_path(@trip)
      #here need to redirect to Day 1 page instead of trip page
    else
      render :new
    end
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
    # @marker_suggestions_day = (@current_hotel + @current_restaurants + @current_activities)
    # @day_markers = [@current_hotel] + @current_activities + @current_restaurants
    # FOR THE MAP
    # @markers = @day_markers.map do |suggestion|
    #   {
    #     lat: suggestion.latitude,
    #     lng: suggestion.longitude,
    #     id: suggestion.id,
    #     icon: helpers.asset_url("#{suggestion.category}.png"),
    #     info_window: render_to_string(partial: "info_window", locals: { suggestion: suggestion })
    #   }
    # end

    @client = GooglePlaces::Client.new(ENV['GOOGLE_API_BROWSER_KEY'])
    @hotels_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Hotel")
    @restaurants_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Restaurant")
    @activities_ordered_by_vote = Suggestion.by_day_and_category_order_by_vote(@day, "Activity")
    # END FOR THE MAP

    #daily cost of trip
    @day_cost = 0
    @current_activities_restaurants.each do |suggestion|
      unless suggestion.price.nil? || suggestion.price == 0
        @day_cost+=suggestion.price
      end
    end
    unless @current_hotel.nil?
      @day_cost+=@current_hotel.price
    end
  end


  # def trip_cost
  #   @trip       = Trip.find(params[:id])
  #   @trip_days  = @trip.days.order(:date)
  #   @trip_cost  = 0

  #   @trip_days.each do |day|
  #     current_day_suggestions = day.
  #                               suggestions.
  #                               left_joins(:votes).group(:id).
  #                               order('COUNT(votes.id) DESC')
  #     @current_hotel = current_day_suggestions.
  #                     where(category: "Hotel").
  #                     first
  #     @current_activities = current_day_suggestions.
  #                         where(category: "Activity").
  #                         first(3)
  #     @current_restaurants = current_day_suggestions.
  #                         where(category: "Restaurant").
  #                         first(2)

  #     @current_suggestions = (@current_activities + @current_restaurants + @current_hotel)
  #     @daily_cost = 0
  #     @current_suggestions.each do |suggestion|
  #       unless suggestion.price.nil? || suggestion.price == 0
  #         @daily_cost += suggestion.price
  #       end
  #     end
  #     @trip_cost += @daily_cost
  #   end
  # end


  def lock_trip
    @trip = Trip.first
    if @trip.locked == false
      @trip.locked = true
      @trip.save!
      respond_to do |format|
        format.html { redirect_to trip_path(@trip), notice: 'Votes have sucessfully been locked!' }
      end
    else
      @trip.locked = false
      @trip.save!
      respond_to do |format|
        format.html { redirect_to trip_path(@trip), notice: 'Votes have sucessfully been unlocked!' }
      end
    end
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
