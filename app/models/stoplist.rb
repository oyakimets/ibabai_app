class Stoplist < ActiveRecord::Base
	validates :customer_id, presence: true
	validates :client_id, presence: true
	belongs_to :client
	belongs_to :customer
end
