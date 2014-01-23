class ChangeNameToCFormats < ActiveRecord::Migration
  def change
  	rename_table :c_formats, :catforms
  end
end
