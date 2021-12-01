class Trip < ApplicationRecord
  has_many :trip_members
  has_many :users, through: :trip_members
  has_many :days

  has_one :creator, class_name: "User"

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  after_create :days_generation
  after_create :add_creator_to_trip_member

  private

  def days_generation
    trip_date = end_date - start_date
    trip_date.to_i.times do |i|
      new_day = Day.new(date: start_date + i, trip: self)
      new_day.save
    end
    last_day = Day.new(date: end_date, trip: self)
    last_day.save
  end

  def add_creator_to_trip_member
    user = User.find(creator_id)
    TripMember.create(user: user, trip: self)
  end
end
