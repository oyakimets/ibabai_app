class ChangeNameToFormats < ActiveRecord::Migration
  def change
  	rename_table :formats, :formatts
  	rename_column :catforms, :format_id, :formatt_id
  	rename_column :stores, :format_id, :formatt_id
  end
end
