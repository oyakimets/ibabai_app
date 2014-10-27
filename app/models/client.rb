class Client < ActiveRecord::Base
	has_many :users
	has_many :promoacts, through: :users
	has_many :customers, through: :stoplists
	validates :name, presence: true, uniqueness: true
	validates :contacts, presence: true
end
