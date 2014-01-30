class Promobrand < ActiveRecord::Base
	belongs_to :brand
	belongs_to :promoact
	validates :promoact_id, presence: true
	validates :brand_id, presence: true
end

