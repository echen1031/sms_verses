class UserMailer < ActionMailer::Base
  default from: "dispenser@comingtohim.com"

  def start_subscription(user, user_subscription)
    @user = user
    @user_subscription = user_subscription
    @url = 'http://comingtohim.com/login'
    mail(to: @user_subscription.email, subject: 'Welcome to Coming to Him')
  end

  def end_subscription(user, user_subscription)
    @user = user
    @user_subscription = user_subscription
    @url = 'http://comingtohim.com/login'
    mail(to: @user_subscription.email, subject: 'Goodbye')
  end

  def daily(user, user_subscription, verse)
  	@user = user
    @user_subscription = user_subscription
    @bible_verse = verse
    @url = 'http://comingtohim.com/login'
    mail(to: @user_subscription.email, subject: 'Daily Verse')
  end
end
