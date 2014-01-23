class Action < ActiveRecord::Base
	belongs_to :brand
	belongs_to :user
	has_many :actcities
	has_many :cities, through: :actcities
	has_many :actsegments
	has_many :segments, through: :actsegments
	has_many :actformats
	has_many :formats, through: :actformats
	has_many :actchains
	has_many :chains, through: :actchains
	validates :name, presence: true
	validates :brand_id, presence: true
	validates :user_id, presence: true
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
