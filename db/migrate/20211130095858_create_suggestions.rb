class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.string :category
      t.string :name
      t.references :day, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :price
      t.text :description
      t.text :comment
      t.float :latitude
      t.float :longitude
      t.string :photo
      t.string :google_link
      t.float :rating
      t.string :location
      t.string :opening_hours

      t.timestamps
    end
  end
end
