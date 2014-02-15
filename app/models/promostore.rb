class Promostore < ActiveRecord::Base
	belongs_to :promoact
	belongs_to :store
	validates :promoact_id, presence: true
	validates :store_id, presence: true
	validates :city_id, presence: true
	validates :category_id, presence: true
end
