class AddCreatorReferenceToTrips < ActiveRecord::Migration[6.0]
  def change
    add_reference :trips, :creator, foreign_key: { to_table: :users }
  end
end
