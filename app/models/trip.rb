class Trip < ApplicationRecord
  has_many :trip_members
  has_many :users, through: :trip_members
  has_many :days

  has_one :creator, class_name: "User"

  validates :name, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true
end
