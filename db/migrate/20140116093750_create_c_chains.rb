class CreateCChains < ActiveRecord::Migration
  def change
    create_table :c_chains do |t|
      t.integer :category_id
      t.integer :chain_id

      t.timestamps
    end
  end
end
