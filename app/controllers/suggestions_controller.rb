class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end

  def create
    day = Day.find(params[:day_id])
    @suggestion = Suggestion.new("name",
       day: day,
       user: current_user,
       price: 15,
       description: "description",
       comment: "comment",
       latitude: "latitude",
       longitude: "longitude",
       photo: "photo",
       google_link: "google_link",
       rating: "rating",
       location: "location",
       opening_hours: "opening_hours"
      )
    @suggestion.save!
    # REDIRECT
  end
end
