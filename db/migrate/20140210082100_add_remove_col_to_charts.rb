class AddRemoveColToCharts < ActiveRecord::Migration
  def change
  	remove_column :charts, :feedback_id
  	remove_column :charts, :feedback_val
  	add_column :charts, :code_1, :integer
  	add_column :charts, :code_2, :integer
  	add_column :charts, :code_3, :integer
  end
end
