class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.datetime :dob
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :district

      t.timestamps null: false
    end
  end
end
