class Format < ActiveRecord::Base
	has_many :catforms
	has_many :categories, through: :catforms
	has_many :actformats
	has_many :actions, through: :actformats
	validates :name, presence: true

	def self.from_formats(category)
		format_ids = category.format_ids
		where("id IN (?)", format_ids)
	end
end
