class UserSubscription < ActiveRecord::Base
  require_dependency 'user_subscription/sendhub'
  include UserSubscription::Sendhub

  attr_accessible :email, :phone, :remind_hour, :sms_id, :time_zone, 
                  :send_day_1, :send_day_2, :send_day_3, :send_day_4, :send_day_5, :send_day_6, :send_day_7
  validates_numericality_of :phone, :remind_hour
  validates :email, :email_format => {:message => 'does no look like an email address'}
  validates :phone, format: { with: /\d{10}/, message: "bad format" }
  validate :has_either_email_or_phone, :has_at_least_one_day_selected
#  validates :time_zone, inclusion: { in: %w(small medium large),
#                                        message: "Invalid time zone" }

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

  def has_either_email_or_phone
    errors.add(:email, "Please enter either email or phone") if email.nil? and phone.nil?
  end

  def has_at_least_one_day_selected
    if not [send_day_1, send_day_2, send_day_3, send_day_4, send_day_5, send_day_6, send_day_7].any?{|d|d}
      errors.add(:send_day_1, "Please select at least one day")
    end
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
