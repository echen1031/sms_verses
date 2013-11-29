class TextVerseWorker
  include Sidekiq::Worker
  def perform(user_subscription_id, bible_verse_id)
  	user_subscription = UserSubscription.find(user_subscription_id)
    bible_verse = BibleVerse.find(bible_verse_id)
    raise 'invalid request' if user_subscription.nil? or bible_verse.nil?    
    user_subscription.sendhub.post_messages({ 	:contacts => [user_subscription.sms_id], 
    											:text => bible_verse.text_message}) 
   	logger.info('text messages')    
  end
end