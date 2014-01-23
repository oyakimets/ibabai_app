class AddIndexToCChains < ActiveRecord::Migration
  def change
  	add_index :c_chains, :category_id
  	add_index :c_chains, :chain_id
  	add_index :c_chains, [:category_id, :chain_id], unique: true
  end
end
