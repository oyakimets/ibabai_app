class AddOptionToFormats < ActiveRecord::Migration
  def change
  	change_column :formats, :name, :string, null: false
  end
end
