class DropTablePromoRecords < ActiveRecord::Migration
  def change
  	drop_table(:promo_records)
  end
end
