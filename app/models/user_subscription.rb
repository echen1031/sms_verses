class UserSubscription < ActiveRecord::Base
  require_dependency 'user_subscription/sendhub'
  include UserSubscription::Sendhub

  attr_accessible :email, :phone, :remind_hour, :sms_id
  belongs_to :user

  before_validation :normalize_phone

  def normalize_phone
  	self.phone = self.phone.gsub(/\D/, '') unless self.phone.nil?  	
  end

  def send_now
  	bible_verse = BibleVerse::random
  	EmailVerseWorker.perform_async(self.id, bible_verse.id) if self.email 
  	TextVerseWorker.perform_async(self.id, bible_verse.id) if self.phone and self.sms_id
  end  

  def self.schedule_all
    logger.info 'schedule_all'
    bible_verse = BibleVerse::random
    UserSubscription.all.each do |us|
      next if us.remind_hour.nil?
      scheduled_at = DateTime.now.beginning_of_day.advance(:hours => us.remind_hour)
      next if scheduled_at < DateTime.now
      logger.info("subscription #{us.id} is scheduled at #{scheduled_at}")
      EmailVerseWorker.perform_in(scheduled_at, us.id, bible_verse.id) if us.email
      TextVerseWorker.perform_in(scheduled_at, us.id, bible_verse.id) if us.phone and us.sms_id            
    end
  end
end
