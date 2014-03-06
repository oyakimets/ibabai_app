class Catform < ActiveRecord::Base
	
	belongs_to :format 
	belongs_to :category
	validates :category_id, presence: true
	validates :format_id, presence: true

end
