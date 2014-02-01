class Promoact < ActiveRecord::Base
	mount_uploader :cont_tag, ContTagUploader
	mount_uploader :cont_pres, ContPresUploader
	mount_uploader :cont_desc, ContDescUploader 
	belongs_to :user	
	has_many :promorelations, dependent: :destroy
	has_many :promobrands
	has_many :brands, through: :promobrands
	has_many :promoprods
	has_many :prodcats, through: :promoprods
	has_many :promofeedbacks
	has_many :feedbacks, through: :promofeedbacks
	has_many :promocats
	has_many :categories, through: :promocats
	has_many :promocities
	has_many :cities, through: :promocities
	has_many :promosegments
	has_many :segments, through: :promosegments
	validates :name, presence: true, uniqueness: { scope: :user_id, message: " is already in use by you." }
	validates :brand_id, presence: true
	validates :user_id, presence: true
	validates :start_date, presence: true
	validate :start_cannot_be_in_the_past, :finish_cannot_be_before_start 
	

	def start_cannot_be_in_the_past
		if start_date.present? && start_date < Date.today
			errors.add(:start, "Start date can't be in the past.")
		end
	end
	def finish_cannot_be_before_start
		if finish_date.present? && start_date.present? && finish_date < start_date
			errors.add(:finish, "Finish date can't be before start.")
		end
	end

	def self.from_past_promo(user)
    	client_id = user.client_id
    	where("status = ? AND client_id = ?", 6, client_id )
  	end  	
end
