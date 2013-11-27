class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = 'http://comingtohim.com/login'
    mail(to: @user.email, subject: 'Welcome to Coming to Him')
  end
end
