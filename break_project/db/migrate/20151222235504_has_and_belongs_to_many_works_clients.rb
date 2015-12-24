class HasAndBelongsToManyWorksClients < ActiveRecord::Migration
  def change
    create_table :clients_workers, id: false do |t|
      t.belongs_to :client, index: true
      t.belongs_to :worker, index: true
    end
  end
end
