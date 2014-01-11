class Brand < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :user_id, presence: true
end
