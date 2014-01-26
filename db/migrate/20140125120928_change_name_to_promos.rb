class ChangeNameToPromos < ActiveRecord::Migration
  def change
  	rename_table :promos, :promoacts
  end
end
