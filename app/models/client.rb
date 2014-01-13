class Client < ActiveRecord::Base
	has_many :users
	has_many :brands, through: :users
	has_many :actions, through: :brands
	validates :name, presence: true, uniqueness: true
	validates :contacts, presence: true
end
