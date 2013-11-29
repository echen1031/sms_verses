class RemoveIsActiveFromUserSubscription < ActiveRecord::Migration
  def up
  	remove_column :user_subscriptions, :is_active
  end

  def down
  end
end
