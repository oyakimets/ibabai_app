class CreatePromoprods < ActiveRecord::Migration
  def change
    create_table :promoprods do |t|
      t.integer :promoact_id
      t.integer :prodcat_id

      t.timestamps
    end
  end
end
