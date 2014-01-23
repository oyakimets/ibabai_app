class Actsegment < ActiveRecord::Base
	belongs_to :action
	belongs_to :segment
	validates :action_id, presence: true
	validates :segment_id, presence: true
end
