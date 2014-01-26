class Promosegment < ActiveRecord::Base
	belongs_to :promoact
	belongs_to :segment
	validates :promoact_id, presence: true
	validates :segment_id, presence: true
end
