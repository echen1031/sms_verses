class UserSubscription < ActiveRecord::Base
  attr_accessible :email, :is_active, :phone, :remind_hour, :remind_minute

  belongs_to :user
end
