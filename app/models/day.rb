class Day < ApplicationRecord
  belongs_to :trip
  has_many :suggestions #, -> { order(position: :asc) }

  validates :date, presence: true
end
