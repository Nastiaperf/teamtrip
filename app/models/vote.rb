class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
  validates :user_id, uniqueness: { scope: :suggestion_id }
end
