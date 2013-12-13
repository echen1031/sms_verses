class PhoneCarrier < ActiveRecord::Base
  attr_accessible :email_format, :name

  PHONE_CARRIERS = {'AT&T' => 'txt.att.net', 
  									'Verizon' => 'vtext.com', 
  									'T-Mobile' => 'tmomail.net' }
  validates :name, inclusion: { in: PHONE_CARRIERS }
      
  def self.create_all
  	PHONE_CARRIERS.each_pair do |name, email_format|
  		PhoneCarrier.create(name: name, email_format: email_format)
  	end
  end
end
