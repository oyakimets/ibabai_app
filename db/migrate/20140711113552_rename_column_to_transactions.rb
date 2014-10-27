class RenameColumnToTransactions < ActiveRecord::Migration
  def change  	
  	rename_column :transactions, :type, :dc_flag
  end
end
