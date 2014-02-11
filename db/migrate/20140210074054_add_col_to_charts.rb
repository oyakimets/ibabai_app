class AddColToCharts < ActiveRecord::Migration
  def change
  	add_column :charts, :opened, :integer
  end
end
