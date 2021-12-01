class Suggestion < ApplicationRecord
  belongs_to :day
  belongs_to :user
  has_many :votes
  has_many :users, through: :votes

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?

  validates_inclusion_of :category, in: %w[Hotel Restaurant Activity]
  validates :name, presence: true
  attribute :price, :float, default: 0
end
