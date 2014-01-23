class AddOptionsToCFormats < ActiveRecord::Migration
  def change
  	change_column :c_formats, :category_id, :integer, null: false
  	change_column :c_formats, :format_id, :integer, null: false
  end
end
