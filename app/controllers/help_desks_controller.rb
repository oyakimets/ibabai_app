class HelpDesksController < ApplicationController	

	def create
		@help_desk = current_user.help_desks.build(help_desk_params)

		if @help_desk.save!
			if !@help_desk.message.blank?
				SupportMailer.support_request(@help_desk).deliver
				flash[:success] = "Your mail has been sent. We'll revert in no time!"
			elsif @help_desk.message.blank? && @help_desk.callback == true
				flash[:success] = "Your request has been registered. We'll call you back in no time!"
			end
			redirect_to help_url
		else
			flash[:error] = "Error. Try again or contact us on hot-line"
			render "help"
		end
	end	

	private

		def help_desk_params
  			params.require(:help_desk).permit(:message, :callback)
  		end
end
