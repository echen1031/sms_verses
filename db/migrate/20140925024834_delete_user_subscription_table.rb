class DeleteUserSubscriptionTable < ActiveRecord::Migration
  def change
    drop_table :user_subscriptions
  end
end
