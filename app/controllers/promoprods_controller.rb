class PromoprodsController < ApplicationController
	def destroy
		@promoprod = Promoprod.find(params[:id])
		@promoact = @promoprod.promoact
		@promoprod.destroy
		redirect_to edit_promoact_url(@promoact)
	end		
end