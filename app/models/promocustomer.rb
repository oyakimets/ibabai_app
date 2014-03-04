class Promocustomer < ActiveRecord::Base
	belongs_to :promoact
	belongs_to :customer
	validates :promoact_id, presence: true
	validates :customer_id, presence: true
	validates :city_id, presence: true
	validates :segment_id, presence: true
	
end
