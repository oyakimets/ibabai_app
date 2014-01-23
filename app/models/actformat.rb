class Actformat < ActiveRecord::Base
	belongs_to :action
	belongs_to :format
	validates :action_id, presence: true
	validates :format_id, presence: true
end
