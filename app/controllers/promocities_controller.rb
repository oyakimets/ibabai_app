class PromocitiesController < ApplicationController
	def destroy
		@promocity = Promocity.find(params[:id])
		@promoact = @promocity.promoact
		@promocity.destroy
		redirect_to edit_promoact_url(@promoact)
	end		
end


