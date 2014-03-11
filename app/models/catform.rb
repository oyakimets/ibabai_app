class Catform < ActiveRecord::Base
	
	belongs_to :formatt 
	belongs_to :category
	validates :category_id, presence: true
	validates :formatt_id, presence: true

end
