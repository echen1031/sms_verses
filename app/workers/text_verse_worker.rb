class TextVerseWorker
  include Sidekiq::Worker

  def perform(user_subscription_id, bible_verse_id)
  	user_subscription = UserSubscription.find(user_subscription_id)
    bible_verse = BibleVerse.find(bible_verse_id)
    raise 'invalid request' if user_subscription.nil? or bible_verse.nil?    
    UserMailer.daily_sms(user_subscription, bible_verse).deliver 
    # user_subscription.sendhub.post_messages({ :contacts => [user_subscription.sms_id], 
    # 											:text => bible_verse.text_message})    	
  end
end