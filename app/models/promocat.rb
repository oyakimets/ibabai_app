class Promocat < ActiveRecord::Base
	belongs_to :promoact
	belongs_to :category
	validates :promoact_id, presence: true
	validates :category_id, presence: true
end
