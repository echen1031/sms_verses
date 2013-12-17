class UserSubscription < ActiveRecord::Base
  require_dependency 'user_subscription/sendhub'
  include UserSubscription::Sendhub

  EARLIEST_HOUR = 5
  LASTEST_HOUR = 23
  RANDOM_HOUR = 99

  attr_accessible :email, :phone, :remind_hour, :sms_id, :time_zone, 
                  :send_day_1, :send_day_2, :send_day_3, :send_day_4, :send_day_5, :send_day_6, :send_day_7
  phony_normalize :phone, :default_country_code => 'US'
  validates_numericality_of :phone, :remind_hour
  validates :email, :email_format => {:message => 'does not look valid'}
  validates :phone, :phony_plausible => true
  validates :remind_hour, inclusion: { in: (5..23).to_a+[RANDOM_HOUR]}
  validate :has_either_email_or_phone, :has_at_least_one_day_selected

  belongs_to :user


  def readable_time
    if remind_hour == 99
      "Random"
    else
      Time.parse("#{remind_hour}:00").strftime("%l %P")
    end
  end

  def subscription_days
    resultstring = ""

    if send_day_1 == true 
          resultstring = resultstring + "Sun /" 
    end 
    if send_day_2 == true 
          resultstring = resultstring + "Mon /" 
    end 
    if send_day_3 == true 
          resultstring = resultstring + "Tues /" 
    end 
    if send_day_4 == true 
          resultstring = resultstring + "Wed /" 
    end 
    if send_day_5 == true 
          resultstring = resultstring + "Thurs /" 
    end 
    if send_day_6 == true 
          resultstring = resultstring + "Fri /" 
    end 
    if send_day_7 == true 
          resultstring = resultstring + "Sat /" 
    end 
              resultstring
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
    UserSubscription.where("remind_hour IS NOT NULL").each do |us|
      bible_verse = BibleVerse::random
      next if us.remind_hour.nil?
      
      scheduled_hour = (us.remind_hour == 99) ? (8..20).to_a.sample : us.remind_hour
      scheduled_at = DateTime.now.beginning_of_day.advance(:hours => scheduled_hour)

      next if scheduled_at < DateTime.now
      logger.info("subscription #{us.id} is scheduled at #{scheduled_at}")
      EmailVerseWorker.perform_in(scheduled_at, us.id, bible_verse.id) if us.email
      TextVerseWorker.perform_in(scheduled_at, us.id, bible_verse.id) if us.phone and us.sms_id            
    end
  end

  def self.select_hours
    [['Random', RANDOM_HOUR]] + (EARLIEST_HOUR..LASTEST_HOUR).to_a.map {|h| [Time.parse("#{h}:00").strftime("%l %P"), h ] }
  end
end
