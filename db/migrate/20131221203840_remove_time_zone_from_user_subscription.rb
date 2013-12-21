class RemoveTimeZoneFromUserSubscription < ActiveRecord::Migration
  def up
  	remove_column :user_subscriptions, :time_zone
  end

  def down
  end
end
