class Promorelation < ActiveRecord::Base
	belongs_to :promoact
	belongs_to :past_promoact, class_name: "Promoact"
	validates :promoact_id, presence: true
	validates :past_promoact_id, presence: true	
end
