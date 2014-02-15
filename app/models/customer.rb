class Customer < ActiveRecord::Base
	validates :gender, presence: true
	validates :age, presence: true
	has_many :promocustomers
	has_many :promoacts, through: :promocustomers	
	
end
