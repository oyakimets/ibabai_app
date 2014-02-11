module ChartsHelper
	def fb_symb(fb)
		case fb
			when "2" then code = :code_1
			when "3" then code = :code_2
			when "4" then code = :code_3	
		end
	end
end
