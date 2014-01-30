class Client < ActiveRecord::Base
	has_many :users
	has_many :promoacts, through: :users
	validates :name, presence: true, uniqueness: true
	validates :contacts, presence: true
end
