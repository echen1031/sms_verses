class UserSubscription < ActiveRecord::Base
  attr_accessible :created_at, :email, :is_active, :phone, :remind_at, :updated_at, :verse_count

  belongs_to :user
end
