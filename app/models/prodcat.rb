class Prodcat < ActiveRecord::Base
	has_many :brands	
	has_many :promoprods
	has_many :promoacts, through: :promoprods
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	default_scope -> { order('name ASC') }
end
