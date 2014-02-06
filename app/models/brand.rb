class Brand < ActiveRecord::Base
	belongs_to :prodcat
	belongs_to :user
	has_many :promobrands
	has_many :promoacts, through: :promobrands
	default_scope -> { order('name ASC') }
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :user_id, presence: true
	validates :prodcat_id, presence: true

	def self.from_brands(user)
		client_id = user.client_id
		where("client_id = ? AND dropped IS ?", client_id, nil)
	end	

	def self.show_brands(promoact)
		brand_ids = promoact.brand_ids
		where("id IN (?)", brand_ids)
	end	
	
end
