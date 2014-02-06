class PromobrandsController < ApplicationController
	def destroy
		@promobrand = Promobrand.find(params[:id])
		@promoact = @promobrand.promoact
		@promobrand.destroy
		redirect_to edit_promoact_url(@promoact)
	end		
end

  