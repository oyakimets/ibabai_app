class CustLog < ActiveRecord::Base
	
	after_commit :log_seg_cat, on: :create

	def log_seg_cat
		self.update_attributes(segment_id: Promocustomer.where("customer_id = ? AND promoact_id = ?", self.customer_id, self.promoact_id).first.segment_id,
			category_id: Promostore.where("store_id = ? AND promoact_id = ?", self.store_id, self.promoact_id).first.category_id)
	end

	def self.fb_register(promoact, feedback)
		where("promoact_id = ? and #{feedback.to_s} = ?", promoact, true)
	end
end
