class CreateActcustomers < ActiveRecord::Migration
  def change
    create_table :actcustomers do |t|
      t.integer :action_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
