FactoryGirl.define do
  factory :user do
    sequence(:email)    { |n| "#{Forgery(:internet).user_name}#{n}@#{Forgery(:internet).domain_name}" }
    password "password"
    password_confirmation "password"    
  end  
end