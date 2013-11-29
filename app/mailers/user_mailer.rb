class UserMailer < ActionMailer::Base
  default from: "dispenser@comingtohim.com"

  def start_subscription(user, user_subscription)
    @user = user
    @user_subscription = user_subscription
    @url = 'http://comingtohim.com/login'
    begin
      mail(to: @user_subscription.email, subject: 'Welcome to Coming to Him')
    rescue Net::SMTPUnknownError => e
      logger.error(e)
    end
  end

  def end_subscription(user, user_subscription)
    @user = user
    @user_subscription = user_subscription
    @url = 'http://comingtohim.com/login'
    begin
      mail(to: @user_subscription.email, subject: 'Goodbye')
    rescue Net::SMTPUnknownError => e
      logger.error(e)
    end
  end

  def daily(user, user_subscription, verse)
  	@user = user
    @user_subscription = user_subscription
    @bible_verse = verse
    @url = 'http://comingtohim.com/login'
    begin
      mail(to: @user_subscription.email, subject: 'Daily Verse')
    rescue Net::SMTPUnknownError => e
      logger.error(e)
    end
  end
end
