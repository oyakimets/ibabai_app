class Formatt < ActiveRecord::Base
	has_many :stores
	has_many :catforms
	has_many :categories, through: :catforms
	validates :name, presence: true

	def self.from_formatts(category)
		formatt_ids = category.formatt_ids
		where("id IN (?)", formatt_ids)
	end
end

