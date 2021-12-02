class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
    # @day = Day.find(params[:day_id])
  end

  def create
    # day = Day.find(params[:day_id])
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user
    @suggestion.location = "location"
    @suggestion.day = Day.first
    # for @suggestion.day value --> Day.find(params[:day_id])

    @suggestion.save
    # redirect_to day_path(@day)
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:day, :user, :price, :name, :category, :location)
  end
end
