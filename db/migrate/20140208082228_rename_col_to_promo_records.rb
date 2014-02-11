class RenameColToPromoRecords < ActiveRecord::Migration
  def change
  	rename_column :promo_records, :code_1, :delivered
  	rename_column :promo_records, :code_2, :opened
  	rename_column :promo_records, :code_3, :purchased
  end
end
