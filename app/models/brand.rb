class Brand < ActiveRecord::Base
	belongs_to :prodcat
	belongs_to :user
	has_many :actions
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :user_id, presence: true
	validates :prodcat_id, presence: true
end
