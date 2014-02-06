class AddIndexesToJointTables < ActiveRecord::Migration
  def change
  	add_index :promobrands, :promoact_id
  	add_index :promobrands, :brand_id
  	add_index :promobrands, [:promoact_id, :brand_id], unique: true

  	add_index :promocats, :promoact_id
  	add_index :promocats, :category_id
  	add_index :promocats, [:promoact_id, :category_id], unique: true

  	add_index :promocities, :promoact_id
  	add_index :promocities, :city_id
  	add_index :promocities, [:promoact_id, :city_id], unique: true
  	
  	add_index :promocustomers, :promoact_id
  	add_index :promocustomers, :customer_id
  	add_index :promocustomers, [:promoact_id, :customer_id], unique: true

  	add_index :promofeedbacks, :promoact_id
  	add_index :promofeedbacks, :feedback_id
  	add_index :promofeedbacks, [:promoact_id, :feedback_id], unique: true

  	add_index :promoprods, :promoact_id
  	add_index :promoprods, :prodcat_id
  	add_index :promoprods, [:promoact_id, :prodcat_id], unique: true

  	add_index :promosegments, :promoact_id
  	add_index :promosegments, :segment_id
  	add_index :promosegments, [:promoact_id, :segment_id], unique: true

  	add_index :promostores, :promoact_id
  	add_index :promostores, :store_id
  	add_index :promostores, [:promoact_id, :store_id], unique: true

  end
end
