class RollbackOptionToCChains < ActiveRecord::Migration
  def change
  	change_column :c_chains, :category_id, :integer
  	change_column :c_chains, :chain_id, :integer
  end
end
