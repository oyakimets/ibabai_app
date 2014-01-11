class Client < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :contacts, presence: true
end
