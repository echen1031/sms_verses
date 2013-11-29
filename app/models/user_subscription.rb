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
  	verse = BibleVerse::random
  	self.send_email(verse) if self.email 
  	self.send_phone(verse) if self.phone  	  
  end

  def send_email(verse)
    begin
      UserMailer.daily(self.user, self, verse).deliver 
      logger.info('mailed')
    rescue Net::SMTPUnknownError => e
      logger.info('Not mailed')
      logger.error(e)
    end
  end  
end
