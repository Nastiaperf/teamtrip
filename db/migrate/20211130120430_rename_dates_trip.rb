class RenameDatesTrip < ActiveRecord::Migration[6.0]
  def change
    rename_column(:trips, :startdate, :start_date)
    rename_column(:trips, :enddate, :end_date)
  end
end
