class AddColumnTransactions < ActiveRecord::Migration
  def change  	 
    add_column :transactions, :phone, :string
    add_column :transactions, :account, :string
  end  
end
