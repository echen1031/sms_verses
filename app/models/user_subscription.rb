class UserSubscription < ActiveRecord::Base
  attr_accessible :email, :is_active, :phone, :remind_hour, :remind_minute, :verse_count

  belongs_to :user
end
