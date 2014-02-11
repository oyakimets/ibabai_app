class Chart < ActiveRecord::Base
	def fb_converter(fb_id)
		case fb_id
			when "2" then self.code_1
			when "3" then self.code_2
			when "4" then self.code_3
		end		
	end

	def self.promoact_chart(pa, fb)
		where("promoact_id = ?", pa).first.fb_converter(fb)
	end
end
