FactoryGirl.define do
  factory :user do
    sequence(:email)    { |n| "#{Forgery(:internet).user_name}#{n}@#{Forgery(:internet).domain_name}" }
    password "password"
    password_confirmation "password"    

    phone  "5556667777"
    sequence(:remind_hour) {|n| (n%14)+8}
    phone_carrier "tmobile"
    send_day_1 true
  end  
end