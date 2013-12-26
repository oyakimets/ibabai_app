class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 } 
	VALID_TEL_REGEX = /\d{12}/
	validates :tel1, presence: true, length: { is: 12 }, format: { with: VALID_TEL_REGEX }
	validates :tel2, presence: true, length: { is: 12 }, format: { with: VALID_TEL_REGEX }
	validates :company, presence: true
end


