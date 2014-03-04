class CreateCustomerLogs < ActiveRecord::Migration
  def change
    create_table :customer_logs do |t|
      t.integer :customer_id
      t.integer :promoact_id
      t.integer :store_id
      t.boolean :fc_1, default: false
      t.boolean :fc_2, default: false
      t.boolean :fc_3, default: false

      t.timestamps
    end
    add_index :customer_logs, :promoact_id
  end
end
