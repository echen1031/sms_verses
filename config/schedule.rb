every 1.day, :at => '4:07 pm' do
  runner "UserSubscription::schedule_all"
end