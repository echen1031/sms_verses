class UserSubscription < ActiveRecord::Base  
  EARLIEST_HOUR = 5
  LASTEST_HOUR = 23
  RANDOM_HOUR = 99

  attr_accessible :email, :phone, :remind_hour, :sms_id, :time_zone, :phone_carrier,
                  :send_day_1, :send_day_2, :send_day_3, :send_day_4, :send_day_5, :send_day_6, :send_day_7
  phony_normalize :phone, :default_country_code => 'US'
  
  validates_numericality_of :phone, :remind_hour
  validates :email, :email_format => {:message => 'does no look like an email address'}
  validates :phone, :phony_plausible => true
  validates_inclusion_of :phone_carrier, :in => Rails.configuration.phone_carriers.keys
  validates_inclusion_of :remind_hour, :in => (5..23).to_a+[RANDOM_HOUR]
  validate :has_either_email_or_phone, :has_at_least_one_day_selected
  
  belongs_to :user
  
  after_create :send_welcome_email
  
  #validations
  def has_either_email_or_phone
    errors.add(:email, "Please enter either email or phone") if email.nil? and phone.nil?
  end

  def has_at_least_one_day_selected
    if not [send_day_1, send_day_2, send_day_3, send_day_4, send_day_5, send_day_6, send_day_7].any?{|d|d}
      errors.add(:send_day_1, "Please select at least one day")
    end
  end

  #sending
  def to_email_for_sms_message
    self.phone[1..-1]+'@'+Rails.configuration.phone_carriers[self.phone_carrier].domain
  end

  def send_welcome_email
    UserMailer.start_subscription(current_user, @user_subscription).deliver
  end

  def send_now
    bible_verse = BibleVerse::random
    EmailVerseWorker.perform_async(self.id, bible_verse.id) if self.email 
    TextVerseWorker.perform_async(self.id, bible_verse.id) if self.phone and self.sms_id
  end

  def self.schedule_all
    logger.info 'schedule_all'
    UserSubscription.where("remind_hour IS NOT NULL").each do |us|
      bible_verse = BibleVerse::random
      
      scheduled_hour = (us.remind_hour == 99) ? (8..20).to_a.sample : us.remind_hour
      scheduled_at = DateTime.now.beginning_of_day.advance(:hours => scheduled_hour)

      next if scheduled_at < DateTime.now
      logger.info("subscription #{us.id} is scheduled at #{scheduled_at}")
      EmailVerseWorker.perform_in(scheduled_at, us.id, bible_verse.id) if us.email
      TextVerseWorker.perform_in(scheduled_at, us.id, bible_verse.id) if us.phone and us.sms_id            
    end
  end

  def self.select_phone_carrier
    Rails.configuration.phone_carriers.to_a.map {|c| [c[1].name, c[0]]}    
  end

  def self.select_hours
    [['Random', RANDOM_HOUR]] + (EARLIEST_HOUR..LASTEST_HOUR).to_a.map {|h| [Time.parse("#{h}:00").strftime("%l %P"), h ] }
  end
end
