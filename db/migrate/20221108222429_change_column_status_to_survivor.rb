class ChangeColumnStatusToSurvivor < ActiveRecord::Migration[7.0]
  def up
    Survivor.update_all(status: 0)
    change_column :survivors, :status, :integer, null: false, default: 0, limit: 3
  end

  def down
    change_column :survivors, :status, :integer
    Survivor.update_all(status: nil)
  end
end
