class AddIndexToCFormats < ActiveRecord::Migration
  def change
  	add_index :c_formats, :category_id
  	add_index :c_formats, :format_id
  	add_index :c_formats, [:category_id, :format_id], unique: true
  end
end
