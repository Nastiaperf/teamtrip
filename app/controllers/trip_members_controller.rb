class TripMembersController < ApplicationController
  def create
    # teamMember creation for when an invited user creates his user on the "trip:id/sign-up" page
    user = User.find(params[:user_id])
    trip = Trip.find(params[:trip_id])
    trip_member = TripMember.new(user: user, trip: trip)
    trip_member.save!
  end
end
