class CreateActchains < ActiveRecord::Migration
  def change
    create_table :actchains do |t|
      t.integer :action_id
      t.integer :chain_id

      t.timestamps
    end
  end
end
