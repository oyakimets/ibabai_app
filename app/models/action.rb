class Action < ActiveRecord::Base
	belongs_to :brand
	validates :name, presence: true
	validates :brand_id, presence: true
	validates :start, presence: true
	validate :start_cannot_be_in_the_past, :finish_cannot_be_before_start

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
