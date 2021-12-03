class ChangeDefaultPriceToZero < ActiveRecord::Migration[6.0]
  def change
    change_column_default :suggestions, :price, 0
  end
end
