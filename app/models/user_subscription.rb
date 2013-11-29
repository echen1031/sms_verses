class UserSubscription < ActiveRecord::Base
  require_dependency 'user_subscription/sendhub'
  include UserSubscription::Sendhub

  attr_accessible :email, :is_active, :phone, :remind_hour, :sms_id
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
end
