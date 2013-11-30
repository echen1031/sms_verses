class UserSubscription < ActiveRecord::Base
  require_dependency 'user_subscription/sendhub'
  include UserSubscription::Sendhub

  attr_accessible :email, :phone, :remind_hour, :sms_id, :send_day_1, :send_day_2, :send_day_3, :send_day_4, :send_day_5, :send_day_6, :send_day_7, :time_zone
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
  end
end
