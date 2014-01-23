class City < ActiveRecord::Base
	has_many :actcities
	has_many :actions, through: :actcities
	validates :name, presence: true
	validates :population, presence: true
end
