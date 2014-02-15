class AddGeoToStores < ActiveRecord::Migration
  def change
    add_column :stores, :lat, :string
    add_column :stores, :lon, :string
  end
end
