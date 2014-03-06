class AddCountColToSegCats < ActiveRecord::Migration
  def change
  	add_column :segments, :cust_count, :integer, default: 0
  	add_column :categories, :cat_count, :integer, default: 0
  end
end
