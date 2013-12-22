class UserSubscriptionDecorator < Draper::Decorator
	delegate_all

  def readable_time
  	remind_hour == 99 ? "Random" : Time.parse("#{remind_hour}:00").strftime("%l %P")  	  
  end

  def subscription_days
  	(1..7).select do |d|
  		self.send('send_day_'+d.to_s)
  	end.join "/"
  end
end