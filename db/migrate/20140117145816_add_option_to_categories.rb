class AddOptionToCategories < ActiveRecord::Migration
  def change
  	change_column :categories, :name, :string, null: false
  end
end
