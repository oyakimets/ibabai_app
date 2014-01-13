class Prodcat < ActiveRecord::Base
	has_many :brands
	has_many :actions, through: :brands
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	default_scope -> { order('name ASC') }
end
