class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.integer :format_id
      t.integer :chain_id

      t.timestamps
    end
  end
end
