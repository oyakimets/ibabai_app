class Catchain < ActiveRecord::Base
	belongs_to :chain 
	belongs_to :category
	validates :category_id, presence: true
	validates :chain_id, presence: true	
end
