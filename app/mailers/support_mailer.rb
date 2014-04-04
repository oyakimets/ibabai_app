class SupportMailer < ActionMailer::Base 

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support_mailer.support_request.subject
  #
  def support_request(help_desk)
    @user = User.find_by(id: help_desk.user_id)
    @help_desk = help_desk
    mail to: "oleg.yakimets@gmail.com", subject: "Support request", from: @user.name
  end
  
end
