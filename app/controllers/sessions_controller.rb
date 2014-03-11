class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in user
			redirect_to promoacts_url
		else
			flash.now[:error] = "Access denied. Try again or contact us for support!"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
