class AddStatusOptionToPromoacts < ActiveRecord::Migration
  def change
  	change_column :promoacts, :status, :integer, default: 1
  end
end
