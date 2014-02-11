class CreatePanals < ActiveRecord::Migration
  def change
    create_table :panals do |t|
      t.integer :promoact_id
      t.integer :brand_id
      t.integer :prodcat_id
      t.integer :code_1
      t.integer :code_2
      t.integer :code_3

      t.timestamps
    end
  end
end
