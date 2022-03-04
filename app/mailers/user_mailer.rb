class UserMailer < ApplicationMailer
    default from: 'teamtrip756@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://www.teamtrip.fr/users/sign_up'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
