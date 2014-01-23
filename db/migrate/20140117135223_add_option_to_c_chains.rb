class AddOptionToCChains < ActiveRecord::Migration
  def change
  	change_column :c_chains, :category_id, :integer, null: false
  	change_column :c_chains, :chain_id, :integer, null: false
  end
end
