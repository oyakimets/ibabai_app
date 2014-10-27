class CreateStoplists < ActiveRecord::Migration
  def change
    create_table :stoplists do |t|
      t.integer :customer_id
      t.integer :client_id

      t.timestamps
    end
  end
end
