class AddDroppedToPromoacts < ActiveRecord::Migration
  def change
    add_column :promoacts, :dropped, :boolean
  end
end
