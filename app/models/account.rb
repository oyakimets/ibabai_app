class Account < ActiveRecord::Base
	has_many :users
	has_many :segments, through: :users
	has_many :brands, through: :users
	has_many :actions, through: :brands
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	def user_list
		User.where("account_id = ?", id)
	end
end
