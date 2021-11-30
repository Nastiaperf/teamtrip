class Trip < ApplicationRecord
  has_many :trip_members
  has_many :users, through: :trip_members
  has_many :days

  has_one :creator, class_name: "User"

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  after_create :days_generation

  private

  def days_generation
    trip_date = end_date - start_date
    trip_date.to_i.times do |i|
      new_day = Day.new(date: start_date + i, trip_id: id)
      new_day.save
    end
    last_day = Day.new(date: end_date, trip_id: id)
    last_day.save
  end
end
