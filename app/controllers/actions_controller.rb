class ActionsController < ApplicationController
	before_action :signed_in_user   
	
	def index
	end

	def show
	end

	def create
	end

	def edit
	end

	def destroy
	end

	private

  		def signed_in_user
  			redirect_to signin_url   unless signed_in?
  			  			
  		end
end
