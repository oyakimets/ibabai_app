class AddUniqIndexToStoplists < ActiveRecord::Migration
  def change
  	add_index :stoplists, [:customer_id, :client_id], unique: true
  end
end
