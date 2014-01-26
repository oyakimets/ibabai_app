class Segment < ActiveRecord::Base
	belongs_to :user
	has_many :promosegments
	has_many :promoacts, through: :promosegments
	default_scope -> { order("name ASC") }
	validates :name, presence: true, uniqueness: { scope: :user_id, message: " is already in use by you." }
	validates :user_id, presence: true
	validate :min_and_max_age
	
	

	def min_and_max_age
		if age_min.present? && age_max.present? && age_min > age_max
			errors.add(:age_max, "can't be below minimum age")
		end
	end
	
end
