class UserSubscription < ActiveRecord::Base
  attr_accessible :email, :is_active, :phone, :remind_hour, :remind_minute, :sms_id

  belongs_to :user

  before_validation :normalize_phone
  after_save :set_sms_id
  
  def normalize_phone
  	self.phone = self.phone.gsub(/\D/, '') unless self.phone.nil?  	
  end

  def set_sms_id
  	return if self.phone.nil?
  	
  	sendhub_hash = { :name => self.email, :number => self.phone}
  	
  	if self.sms_id.nil?
  		response = sendhub.post_contacts(sendhub_hash)
  	else
  		sendhub_hash.merge({ :id => self.sms_id })
  		response = sendhub.put_contacts(sendhub_hash)
  	end  	
  	binding.pry
  end

  def send_now
  	verse = BibleVerse::random
  	self.send_email(verse) if self.email 
  	self.send_phone(verse) if self.phone  	  
  end

  def send_email(verse)
  	begin
  		logger.info('mailed')
  		UserMailer.daily(self.user, self, verse).deliver 
  	rescue Net::SMTPUnknownError => e
  		logger.error(e)
  	end
  end

  def send_phone(verse)
  	begin
	  	binding.pry
	  	logger.info('messaged')
	    sendhub.post_messages({:contacts => [self.sms_id], :text => verse.message}) 
  	rescue e
  		logger.err(e)
  	end
  end

  def sendhub
  	@sendhub ||= SendHub.new(	Rails.configuration.sendhub.api_key, 
                      				Rails.configuration.sendhub.phone)	
  end  
end
