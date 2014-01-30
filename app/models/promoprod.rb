class Promoprod < ActiveRecord::Base
	belongs_to :prodcat
	belongs_to :promoact
	validates :promoact_id, presence: true
	validates :prodcat_id, presence: true
end
