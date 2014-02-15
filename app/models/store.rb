class Store < ActiveRecord::Base
	has_many :promostores, dependent: :destroy
	has_many :promoacts, through: :promostores
	validates :name, presence: true
	validates :city_id, presence: true
	validates :format_id, presence: true
	validates :chain_id, presence: true
	validates :lat, presence: true
	validates :lon, presence: true
end