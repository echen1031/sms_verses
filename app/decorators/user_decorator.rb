class UserDecorator < Draper::Decorator
  delegate_all

  def readable_hour
    remind_hour == 99 ? "Random" : Time.parse("#{remind_hour}:00").strftime("%l %P")  	  
  end

  def subscription_days
    days = (1..7).select {|d| self.send('send_day_'+d.to_s) }
    days.map{|d|Date::ABBR_DAYNAMES[d-1]}.join " / "
  end
end
