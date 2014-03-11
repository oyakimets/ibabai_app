class PasswordResetsController < ApplicationController
	def new			
	end

	def create
		user = User.find_by_email(params[:email])
		user.send_password_reset if user
		redirect_to root_url
		flash[:success] = "Check your email for password reset instructions"
	end

	def edit
		@user = User.find_by_pas_reset_token!(params[:id])
	end

	def update
		@user = User.find_by_pas_reset_token!(params[:id])
		if @user.pas_reset_sent_at < 2.hours.ago
			flash[:error] = "Password reset has expired."
			redirect_to new_password_reset_path  
		elsif @user.update_attributes(user_params)
			flash[:success] = "Password has been reset!"
			log_in @user
			redirect_to root_url
		else
			flash.now[:error] = "Password change failed! Try again or contact us for support"
			render 'edit' 
		end
	end

	def user_params
  		params.require(:user).permit(:password, :password_confirmation)	
  	end
end
