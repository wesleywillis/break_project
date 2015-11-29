class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :clients, :district, :district_id
  end
end
