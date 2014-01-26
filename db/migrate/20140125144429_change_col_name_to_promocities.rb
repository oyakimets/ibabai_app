class ChangeColNameToPromocities < ActiveRecord::Migration
  def change
  	rename_column :promocities, :action_id, :promoact_id
  end
end
