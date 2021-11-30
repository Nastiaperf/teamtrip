class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.date :startdate
      t.date :enddate
      t.string :location
      t.boolean :freeze
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
