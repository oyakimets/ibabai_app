class RenameColPromocusPromofeedPromostores < ActiveRecord::Migration
  def change
  	rename_column :promocustomers, :action_id, :promoact_id
  	rename_column :promofeedbacks, :action_id, :promoact_id
  	rename_column :promostores, :action_id, :promoact_id
  end
end
