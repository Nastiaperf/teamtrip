class ChangeFreezeToLock < ActiveRecord::Migration[6.0]
  def change
    rename_column(:trips, :freeze, :locked)
    change_column_default :trips, :locked, false
  end
end
