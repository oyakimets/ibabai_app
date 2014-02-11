class ChangeTableNameToPanals < ActiveRecord::Migration
  def change
  	rename_table :panals, :promo_records
  end
end
