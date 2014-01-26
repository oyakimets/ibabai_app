class Promocity < ActiveRecord::Base
	belongs_to :promoact
	belongs_to :city
	validates :promoact_id, presence: true
	validates :city_id, presence: true
end
