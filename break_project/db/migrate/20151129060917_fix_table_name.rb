class FixTableName < ActiveRecord::Migration
  def change
    rename_table :hours, :shifts
  end
end
