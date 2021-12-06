class TripMember < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  def index
    @trip_members = TripMember.where(trip_id: @trip)
  end
end
