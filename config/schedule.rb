every 1.day, :at => '4:00 am' do
  runner "User::schedule_all"
end
