class ChangeFreezeToFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_default :trips, :freeze, true
  end
end
