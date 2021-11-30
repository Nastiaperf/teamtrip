class CreateTripMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
