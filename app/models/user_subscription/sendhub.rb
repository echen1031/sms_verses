require 'active_support/concern'
module UserSubscription::Sendhub
  extend ActiveSupport::Concern
  included do
    after_save :set_sms_id, :refresh_all_sms_ids

    def set_sms_id
      return if self.phone.nil?      
      if self.sms_id.nil?
        sendhub.post_contacts({ :name => self.email, :number => self.phone})
      else
        sendhub.put_contacts({ :name => self.email, :number => self.phone, :id => self.sms_id })
      end         
    end

    def refresh_all_sms_ids
      contacts = sendhub.get_contacts
      contacts['objects'].each do |contact_hash|      
        sms_id = contact_hash['id']        
        phone_number = contact_hash['number'].gsub(/^\+1/,'')
        user_subscription = UserSubscription.find_by_phone(phone_number)
        next if user_subscription.nil?
        user_subscription.update_attributes({:sms_id => sms_id})        
      end      
    end

    def send_phone(verse)
      return if self.sms_id.nil?
      begin
        logger.info('messaged')
        sendhub.post_messages({:contacts => [self.sms_id], :text => verse.text_message}) 
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