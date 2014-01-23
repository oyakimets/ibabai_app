class Actcity < ActiveRecord::Base
	belongs_to :action
	belongs_to :city
	validates :action_id, presence: true
	validates :city_id, presence: true
end
