class CreatePromorelations < ActiveRecord::Migration
  def change
    create_table :promorelations do |t|
      t.integer :promoact_id
      t.integer :past_promoact_id

      t.timestamps
    end
    add_index :promorelations, :promoact_id
    add_index :promorelations, :past_promoact_id
    add_index :promorelations, [:promoact_id, :past_promoact_id], unique: true
  end
end
