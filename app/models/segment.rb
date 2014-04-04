class Segment < ActiveRecord::Base
	belongs_to :user
	has_many :promosegments
	has_many :promoacts, through: :promosegments
	default_scope -> { order("name ASC") }
	validates :name, presence: true, uniqueness: { scope: :user_id, message: " is already in use by you." }
	validates :user_id, presence: true
	validate :min_and_max_age	
	

	def min_and_max_age
		if age_min.present? && age_max.present? && age_min > age_max
			errors.add(:age_max, "can't be below minimum age")
		end
	end

	def self.show_segments(promoact)
		segment_ids = promoact.segment_ids
		where("id IN (?)", segment_ids)
	end

	
	def log_cust_count		
		if self.gender.blank?
			gender_ar = ["male", "female"]
		else 
			gender_ar = [self.gender]
		end
		if self.age_min.blank?
			age_min = 15
		else
			age_min = self.age_min
		end
		if self.age_max.blank?
			age_max = 61
		else
			age_max = self.age_max
		end
		if self.income.blank?
			income_ar = ["low", "mid", "high"]
		else
			income_ar = [self.income]
		end						
		cust_count = Customer.where("gender IN (?) AND age >= ? AND age <= ? AND income IN (?)", gender_ar, age_min, age_max, income_ar).count
		self.update_column(:cust_count, cust_count)		
	end		
end	
