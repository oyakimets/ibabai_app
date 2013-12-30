class ActionsController < ApplicationController
	before_action :login   
	
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

  		def login
  			unless signed_in?
  				redirect_to signin_url
  			end
  		end
end
