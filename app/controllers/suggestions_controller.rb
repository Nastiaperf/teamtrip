class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
    # @day = Day.find(params[:day_id])
  end

  def create
    day = Day.find(params[:suggestion][:day_id])

    name = params[:suggestion][:name]

    url = URI("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{name}&inputtype=textquery&fields=formatted_address%2Cphoto%2Crating%2Copening_hours%2Cgeometry&key=AIzaSyD9TVwPVhLsV4XkHFI6fiAkcJ31IqNPGxA")

    response = HTTParty.get(url)

    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.location = response['candidates'][0]['formatted_address']
    @suggestion.rating = response['candidates'][0]['rating']
    @suggestion.opening_hours = response['candidates'][0]['opening_hours']
    @suggestion.user = current_user
    @suggestion.day = day
    # for @suggestion.day value --> Day.find(params[:day_id])
    @suggestion.save!

    redirect_to trip_day_path(day.trip, day)
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:day_id, :user, :price, :name, :category, :location, :comment)
  end
end
