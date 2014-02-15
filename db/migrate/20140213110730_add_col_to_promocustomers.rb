class AddColToPromocustomers < ActiveRecord::Migration
  def change
  	add_column :promocustomers, :city_id, :integer
  	add_column :promocustomers, :segment_id, :integer
  	remove_column :charts, :opened, :integer
  end
end
