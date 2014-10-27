class AddColumnToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :balance, :integer, default: 0
  end
end
