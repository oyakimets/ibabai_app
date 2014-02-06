class PromocatsController < ApplicationController
	def destroy
		@promocat = Promocat.find(params[:id])
		@promoact = @promocat.promoact
		@promocat.destroy
		redirect_to edit_promoact_url(@promoact)
	end		
end