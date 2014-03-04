class AddColumnsToCustLogs < ActiveRecord::Migration
  def change
    add_column :cust_logs, :segment_id, :integer
    add_column :cust_logs, :category_id, :integer
  end
end
