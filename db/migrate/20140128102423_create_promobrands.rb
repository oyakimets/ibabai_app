class CreatePromobrands < ActiveRecord::Migration
  def change
    create_table :promobrands do |t|
      t.integer :promoact_id
      t.integer :brand_id

      t.timestamps
    end
  end
end
