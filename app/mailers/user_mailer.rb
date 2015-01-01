class UserMailer < ActionMailer::Base
  default from: "i@comingtohim.com"

  def start_subscription(user)
    @user = user
    @url = 'http://comingtohim.com/login'
    mail(to: @user.email, subject: 'Welcome to Coming to Him')    
  end

  def end_subscription(user)
    @user = user
    @url = 'http://comingtohim.com/login'
    mail(to: @user.email, subject: 'Goodbye')    
  end

  def daily(user, bible_verse)
    @bible_verse = bible_verse
    mail(to: @user.email, subject: 'Daily Verse')    
  end

  def daily_text_message(user, bible_verse)
    mail(to: user.to_email_for_sms_message) do |format|
      format.text { render text: bible_verse.text_message }
    end
  end
end
