class UserMailer < ApplicationMailer
  default from: 'notif@stockd.com'

  def welcome
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome!')
  end
end
