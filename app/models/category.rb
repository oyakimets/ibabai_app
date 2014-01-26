class Category < ActiveRecord::Base
	belongs_to :user
	has_many :promocats
	has_many :promoacts, through: :promocats
	has_many :catforms, dependent: :destroy
	has_many :catchains, dependent: :destroy	
	has_many :formats, through: :catforms
	has_many :chains, through: :catchains
	validates :name, presence: true, uniqueness: { scope: :user_id, message: " is already in use by you." }
	validates :user_id, presence: true
	
	def format_feed
		Format.from_formats(self)
	end	

	def chain_feed
		Chain.from_chains(self)
	end	
end
