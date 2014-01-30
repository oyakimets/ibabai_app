class AddClientToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :client_id, :integer
  end
end
