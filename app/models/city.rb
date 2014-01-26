class City < ActiveRecord::Base
	has_many :promocities
	has_many :promoacts, through: :promocities
	validates :name, presence: true
	validates :population, presence: true
end
