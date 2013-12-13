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

  def daily(user_subscription, bible_verse)
    @user_subscription = user_subscription
    @bible_verse = bible_verse
    mail(to: @user_subscription.email, subject: 'Daily Verse')    
  end

  def daily_text_message(user_subscription, bible_verse)
    mail(to: user_subscription.to_email_for_sms_message, subject: 's@comingtohim.com') do |format|
      format.text { render text: bible_verse.text_message }
    end
  end
end
