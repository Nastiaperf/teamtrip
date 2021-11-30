class Day < ApplicationRecord
  belongs_to :trip
  has_many :suggestions

  validates :date, presence: true
end
