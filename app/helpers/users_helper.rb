module UsersHelper
  def select_phone_carrier
    Rails.configuration.phone_carriers.to_a.map {|c| [c[1].name, c[0]]}    
  end

  def select_hours
    [['Random (8 am ~ 10 pm)', User::RANDOM_HOUR]] + 
    	(User::EARLIEST_HOUR..User::LASTEST_HOUR).map {|h| [Time.parse("#{h}:00").strftime("%l %P"), h ] }
  end	
end
