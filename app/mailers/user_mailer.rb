class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(from: "aksavinash1994@gmail.com", to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end