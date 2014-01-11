class User < ActiveRecord::Base
	belongs_to :account
	has_many :brands
	default_scope -> { order('created_at DESC') }
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 } 
	VALID_TEL_REGEX = /\d{12}/
	validates :tel1, presence: true, length: { is: 12 }, format: { with: VALID_TEL_REGEX }
	validates :tel2, presence: true, length: { is: 12 }, format: { with: VALID_TEL_REGEX }
	validates :client_id, presence: true

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def send_password_reset
		self.pas_reset_token = User.encrypt(User.new_remember_token)
		self.pas_reset_sent_at = Time.zone.now
		save!(validate: false)
		UserMailer.password_reset(self).deliver
	end

	def list
		Brand.where("user_id = ? AND dropped IS ?", id, nil)
	end	

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

		
end


