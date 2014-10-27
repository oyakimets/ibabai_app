class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  before_save :ensure_authentication_token
  
  devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :trackable, :validatable, :token_authenticatable 
  validates :phone, presence: true
  validates :email, presence: true
	validates :gender, presence: true
	validates :age, presence: true
	has_many :promocustomers
  has_many :transactions
  has_many :cust_logs
  has_many :clients, through: :stoplists
	has_many :promoacts, through: :promocustomers
   
end
