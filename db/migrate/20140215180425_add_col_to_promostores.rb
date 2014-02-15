class AddColToPromostores < ActiveRecord::Migration
  def change
    add_column :promostores, :city_id, :integer
    add_column :promostores, :category_id, :integer
  end
end
