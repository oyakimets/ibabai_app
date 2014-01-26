class Promofeedback < ActiveRecord::Base
	belongs_to :promoact
	belongs_to :feedback
	validates :promoact_id, presence: true
	validates :feedback_id, presence: true
end
