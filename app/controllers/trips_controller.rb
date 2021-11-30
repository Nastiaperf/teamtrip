class TripsController < ApplicationController
  def new
  end

  def create
    @start_date = "03/01/2022"
    @end_date = "11/01/2022"
  end

  def show
  end

  def update
  end

  def days_generation
    trip_date = (@start_date..@end_date).to_a
    trip_date.each do |day|
      Day.new(date: day)
    end
  end
end
