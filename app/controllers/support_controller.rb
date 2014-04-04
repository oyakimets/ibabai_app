class SupportController < ApplicationController
	def help
		@help_desk = current_user.help_desks.build
	end

	def general_page
	end

	def status_page
	end

	def seg_page
	end

	def cat_page
	end

	def na_page
	end

	def ana_page
	end

	def pro_page
	end

	def com_page
	end

	def specs_page
	end

end
