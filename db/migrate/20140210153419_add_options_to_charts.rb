class AddOptionsToCharts < ActiveRecord::Migration
  def change
  	change_column :charts, :code_1, :integer, default: 0
  	change_column :charts, :code_2, :integer, default: 0
  	change_column :charts, :code_3, :integer, default: 0
  	add_index :charts, :promoact_id
  	add_index :charts, :brand_id
  	add_index :charts, :prodcat_id
  end
end
