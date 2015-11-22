class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.datetime :start
      t.datetime :stop
      t.integer :worker_id

      t.timestamps null: false
    end
  end
end
