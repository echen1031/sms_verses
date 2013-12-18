every 1.day, :at => '4:00 am' do
  runner "UserSubscription::schedule_all"
end
