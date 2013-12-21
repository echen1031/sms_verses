class RemoveSmsIdFromUserSubscription < ActiveRecord::Migration
  def up
  	remove_column :user_subscriptions, :sms_id
  end

  def down
  end
end
