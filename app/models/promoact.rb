class Promoact < ActiveRecord::Base
	mount_uploader :cont_tag, ContTagUploader
	mount_uploader :cont_pres, ContPresUploader
	mount_uploader :cont_desc, ContDescUploader
	scope :submitted, -> { where( status: 3) } 
	belongs_to :user
	has_many :promostores, dependent: :destroy
	has_many :stores, through: :promostores
	has_many :promocustomers, dependent: :destroy
	has_many :customers, through: :promocustomers	
	has_many :promorelations, dependent: :destroy
	has_many :past_promoacts, through: :promorelations
	has_many :promobrands, dependent: :destroy
	has_many :brands, through: :promobrands
	has_many :promoprods, dependent: :destroy
	has_many :prodcats, through: :promoprods
	has_many :promofeedbacks, dependent: :destroy
	has_many :feedbacks, through: :promofeedbacks
	has_many :promocats, dependent: :destroy
	has_many :categories, through: :promocats
	has_many :promocities, dependent: :destroy
	has_many :cities, through: :promocities
	has_many :promosegments, dependent: :destroy
	has_many :segments, through: :promosegments
	validates :name, presence: true, uniqueness: { scope: :user_id, message: " is already in use by you." }
	validates :brand_id, presence: true
	validates :user_id, presence: true
	validates :start_date, presence: true
	validate  :finish_cannot_be_before_start
	# validate :start_cannot_be_in_the_past 
	

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

  	def segments_feed
  		Segment.show_segments(self)
  	end 

  	def cities_feed
  		City.show_cities(self)
  	end 

  	def cats_feed
  		Category.show_cats(self)
  	end

  	def prod_feed
  		Prodcat.show_prods(self)
  	end

  	def brand_feed
  		Brand.show_brands(self)
  	end

  	def self.show_promos(promoact)
		past_promoact_ids = promoact.past_promoact_ids
		where("id IN (?)", past_promoact_ids)
	end

  	def promo_feed
  		Promoact.show_promos(self)
  	end  	

	def fb_feed
  		Feedback.show_fbs(self)
  	end

  	def self.a_promoacts(brand)
		where("brand_id = ? AND status = ?", brand.id, 6)
	end

	def self.current_promo(user)
		if user.admin?
			account = Account.find_by(email: user.email)
			user_ids = account.user_ids
			where("user_id IN (?) AND status <> ?", user_ids, 6)
		else
			where("user_id = ? AND status <> ?", user.id, 6)
		end
	end

	def self.past_promo(user)
		if user.admin?
			account = Account.find_by(email: user.email)
			user_ids = account.user_ids
			where("user_id IN (?) AND status = ? AND dropped IS ?", user_ids, 6, nil)
		else
			where("user_id = ? AND status = ? AND dropped IS ?", user.id, 6, nil)
		end
	end		
end
