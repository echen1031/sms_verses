FactoryGirl.define do
  factory :user_subscription do
    phone  "5556667777"
    sequence(:remind_hour) {|n| (n%14)+8}
    phone_carrier "tmobile"
    send_day_1 true

    association :user, factory: :user
  end
end