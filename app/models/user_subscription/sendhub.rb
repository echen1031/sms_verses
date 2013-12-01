require 'active_support/concern'
module UserSubscription::Sendhub
  extend ActiveSupport::Concern
  included do
    after_save :update_sendhub_account

    def update_sendhub_account
      UpdateSendhubWorker.perform_async(self.id)
    end

    #executed by workers
    def save_sendhub_user
      logger.info 'save_sendhub_user'
      return if self.phone.nil?      
      if self.sms_id.nil? or self.sms_id == ""
        sendhub.post_contacts({ :name => self.email, :number => self.phone})
      else
        sendhub.put_contacts({ :name => self.email, :number => self.phone, :id => self.sms_id })
      end         
    end

    #executed by workers
    def refresh_sendhub_ids
      logger.info 'refresh_sendhub_ids'
      contacts = sendhub.get_contacts
      contacts['objects'].each do |contact_hash|      
        sms_id = contact_hash['id']        
        phone_number = contact_hash['number'].gsub(/^\+1/,'')
        user_subscription = UserSubscription.find_by_phone(phone_number)
        next if user_subscription.nil?
        user_subscription.update_attributes({:sms_id => sms_id})        
      end      
    end

    def sendhub
      @sendhub ||= SendHub.new( Rails.configuration.sendhub.api_key, 
                                Rails.configuration.sendhub.phone)  
    end  
  end  
end