class AddAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account, :integer
    add_index :users, :account
  end
end
