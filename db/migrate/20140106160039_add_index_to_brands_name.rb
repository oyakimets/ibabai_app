class AddIndexToBrandsName < ActiveRecord::Migration
  def change
  	add_index :brands, :name, unique: true
  end
end
