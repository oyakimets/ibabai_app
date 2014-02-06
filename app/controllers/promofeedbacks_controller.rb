class PromofeedbacksController < ApplicationController
	def destroy
		@promofeedback = Promofeedback.find(params[:id])
		@promoact = @promofeedback.promoact
		@promofeedback.destroy
		redirect_to edit_promoact_url(@promoact)
	end		
end