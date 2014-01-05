class UserMailer < ActionMailer::Base
  add_template_helper(UsersHelper)	

  default from: "noreply@ibabai.com"

  def password_reset(user)
  	@user = user
  		mail to: user.email, subject: "Password Reset"
  		
  end
    
end

