class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.string :agent_name
      t.integer :agent_id
      t.integer :amount
      t.string :type

      t.timestamps
    end
  end
end
