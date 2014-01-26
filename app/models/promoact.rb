class Promoact < ActiveRecord::Base
	belongs_to :brand
	belongs_to :user
	has_many :promofeedbacks
	has_many :feedbacks, through: :promofeedbacks
	has_many :promocats
	has_many :categories, through: :promocats
	has_many :promocities
	has_many :cities, through: :promocities
	has_many :promosegments
	has_many :segments, through: :promosegments
	validates :name, presence: true, uniqueness: { scope: :user_id, message: " is already in use by you." }
	validates :brand_id, presence: true
	validates :user_id, presence: true
	validates :start_date, presence: true
	

	def start_cannot_be_in_the_past
		if start.present? && start < Date.today
			errors.add(:start, "Start date can't be in the past.")
		end
	end
	def finish_cannot_be_before_start
		if finish.present? && start.present? && finish < start
			errors.add(:finish, "Finish date can't be before start.")
		end
	end
 	
end
