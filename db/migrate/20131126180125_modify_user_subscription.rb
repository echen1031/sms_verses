class ModifyUserSubscription < ActiveRecord::Migration
  def up
  	change_column :user_subscriptions, :is_active, :boolean, :default => true
  	remove_column :user_subscriptions, :remind_at
  	add_column :user_subscriptions, :remind_hour, :integer
  	add_column :user_subscriptions, :remind_minute, :integer
  end

  def down
  end
end
