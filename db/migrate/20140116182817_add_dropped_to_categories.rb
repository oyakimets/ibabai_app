class AddDroppedToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :dropped, :boolean
  end
end
