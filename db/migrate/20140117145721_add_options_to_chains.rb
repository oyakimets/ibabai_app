class AddOptionsToChains < ActiveRecord::Migration
  def change
  	change_column :chains, :name, :string, null: false
  end
end
