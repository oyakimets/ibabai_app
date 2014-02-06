class PromorelationsController < ApplicationController
	def destroy
		@promorelation = Promorelation.find(params[:id])
		@promoact = @promorelation.promoact
		@promorelation.destroy
		redirect_to edit_promoact_url(@promoact)
	end		
end