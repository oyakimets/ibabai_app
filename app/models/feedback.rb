class Feedback < ActiveRecord::Base
	has_many :promofeedbacks
	has_many :promoacts, through: :promofeedbacks
	validates :name, presence: true
end
