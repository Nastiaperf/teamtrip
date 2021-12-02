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
    @suggestion.save!
    redirect_to root_path
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:day_id, :user, :price, :name, :category, :location, :comment)
  end
end
