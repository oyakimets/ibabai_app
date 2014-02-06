class Feedback < ActiveRecord::Base
	has_many :promofeedbacks
	has_many :promoacts, through: :promofeedbacks
	validates :name, presence: true

	def self.show_fbs(promoact)
		feedback_ids = promoact.feedback_ids
		where("id IN (?)", feedback_ids)
	end
end
