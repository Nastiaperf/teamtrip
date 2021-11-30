class DaysController < ApplicationController
  def index
    #days of the trip page
    @days = Day.all
  end

  def show
    #details of the suggestions of the day
    @day = Day.find(params[:id])
  end

end
