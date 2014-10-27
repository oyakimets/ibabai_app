class Account < ActiveRecord::Base
	has_many :users
	has_many :segments, through: :users
	has_many :brands, through: :users
	has_many :promoacts, through: :brands
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	after_create :add_account_to_users 

	def user_list
		User.where("account_id = ?", id)
	end

	def add_account_to_users
		self.users.create(name: self.name, email: self.email, tel1: "123456789012", tel2: "123456789098", client_id: 4, admin: true, password: "ibabai", password_confirmation:"ibabai" )
	end
end
