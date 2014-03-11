class City < ActiveRecord::Base
	has_many :stores
	has_many :promocities
	has_many :promoacts, through: :promocities
	validates :name, presence: true
	validates :population, presence: true

	def self.show_cities(promoact)
		city_ids = promoact.city_ids
		where("id IN (?)", city_ids)
	end
end
