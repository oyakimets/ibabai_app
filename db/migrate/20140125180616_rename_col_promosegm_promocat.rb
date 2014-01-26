class RenameColPromosegmPromocat < ActiveRecord::Migration
  def change
  	rename_column :promocats, :action_id, :promoact_id
  	rename_column :promosegments, :action_id, :promoact_id
  end
end
