require 'active_support/concern'
module UserSubscription::Sendhub
  extend ActiveSupport::Concern
  included do
    after_save :set_sms_id

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
      @sendhub ||= SendHub.new( Rails.configuration.sendhub.api_key, 
                                Rails.configuration.sendhub.phone)  
    end  
  end
end
