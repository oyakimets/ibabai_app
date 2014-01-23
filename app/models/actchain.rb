class Actchain < ActiveRecord::Base
	validates :action_id, presence: true
	validates :chain_id, presence: true
	belongs_to :action
	belongs_to :chain
end
