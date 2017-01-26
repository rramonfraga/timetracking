class WelcomeMailer < ApplicationMailer
  default from: "Rails App Mailer <info.spikedball@gmail.com>"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome, #{@user.name} ")
  end
end
