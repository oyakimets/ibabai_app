class Segment < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order("name ASC") }
	validates :name, presence: true
	validates :user_id, presence: true
	validate :min_and_max_age
	before_create :create_segment_token

	def min_and_max_age
		if age_min.present? && age_max.present? && age_min > age_max
			errors.add(:age_max, "can't be below minimum age")
		end
	end

	def create_segment_token
		self.segment_token = "#{self.user_id}&#{self.name}"
	end	
end
