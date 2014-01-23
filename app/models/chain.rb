class Chain < ActiveRecord::Base
	has_many :catchains
	has_many :categories, through: :catchains
	has_many :actchains
	has_many :actions, through: :actchains
	validates :name, presence:true

	def self.from_chains(category)
		chain_ids = category.chain_ids
		where("id IN (?)", chain_ids)
	end
end
