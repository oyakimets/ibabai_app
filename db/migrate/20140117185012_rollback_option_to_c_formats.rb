class RollbackOptionToCFormats < ActiveRecord::Migration
  def change
  	change_column :c_formats, :category_id, :integer
  	change_column :c_formats, :format_id, :integer
  end
end
