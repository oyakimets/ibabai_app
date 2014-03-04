class RenameTableCustomerLogs < ActiveRecord::Migration
  def change
  	rename_table :customer_logs, :cust_logs
  end
end
