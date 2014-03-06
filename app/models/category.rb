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

	def self.show_cats(promoact)
		category_ids = promoact.category_ids
		where("id IN (?)", category_ids)
	end

	def log_cat_count
		if self.format_ids.empty?
			form_ar = Format.all.collect { |f| f.id }
		else
			form_ar = self.format_ids
		end

		if self.chain_ids.empty?
			chain_ar = Chain.all.collect { |c| c.id }
		else
			chain_ar = self.chain_ids
		end		
		store_count = Store.where("format_id IN (?) AND chain_id IN (?)", form_ar, chain_ar).count
		self.update_column(:cat_count, store_count)		
	end			
end
