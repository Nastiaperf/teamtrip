class AddPositionToSuggestions < ActiveRecord::Migration[6.0]
  def change
    add_column :suggestions, :position, :integer
  end
end
