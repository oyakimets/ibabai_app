class Store < ActiveRecord::Base
	belongs_to :city
	belongs_to :chain
	belongs_to :formatt
	has_many :promostores, dependent: :destroy
	has_many :promoacts, through: :promostores
	validates :name, presence: true
	validates :city_id, presence: true
	validates :formatt_id, presence: true
	validates :chain_id, presence: true
	validates :lat, presence: true
	validates :lon, presence: true
end