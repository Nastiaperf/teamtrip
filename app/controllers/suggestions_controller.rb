class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
    # @day = Day.find(params[:day_id])
  end

  def create
    day = Day.find(params[:suggestion][:day_id])

    name = params[:suggestion][:name]

    url = Addressable::URI.parse("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{name}&inputtype=textquery&fields=formatted_address%2Cphoto%2Crating%2Copening_hours&key=AIzaSyD9TVwPVhLsV4XkHFI6fiAkcJ31IqNPGxA")
    response = HTTParty.get("https://maps.googleapis.com#{url.normalize.request_uri}")
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.location = response['candidates'][0]['formatted_address']
    @suggestion.rating = response['candidates'][0]['rating']
    @suggestion.opening_hours = response['candidates'][0]['opening_hours']
    @suggestion.photo = "https://maps.googleapis.com/maps/api/place/photo?photoreference=#{response['candidates'][0]['photos'][0]['photo_reference']}&sensor=false&maxheight=500&maxwidth=500&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    @suggestion.user = current_user
    @suggestion.day = day
    @suggestion.google_link = "https://www.google.com/maps/search/?api=1&query=#{Addressable::URI.parse(@suggestion.name).normalize}"
    # for @suggestion.day value --> Day.find(params[:day_id])
    @suggestion.save!

    redirect_to trip_day_path(day.trip, day, category: @suggestion.category)
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    @suggestion.update(suggestion_params)

    head :no_content
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:day_id, :user, :price, :name, :category, :location, :comment, :position, :google_link)
  end

end
