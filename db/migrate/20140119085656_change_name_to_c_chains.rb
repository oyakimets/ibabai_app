class ChangeNameToCChains < ActiveRecord::Migration

  def change
  	rename_table :c_chains, :catchains
  end
end
