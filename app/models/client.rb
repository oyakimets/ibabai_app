class Client < ActiveRecord::Base
	has_many :users
	validates :name, presence: true
	validates :contacts, presence: true
end
