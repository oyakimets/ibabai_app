class PromosegmentsController < ApplicationController
	def destroy
		@promosegment = Promosegment.find(params[:id])
		@promoact = @promosegment.promoact
		@promosegment.destroy
		redirect_to edit_promoact_url(@promoact)
	end		
end

