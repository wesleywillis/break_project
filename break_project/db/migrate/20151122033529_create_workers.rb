class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.datetime :dob
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
