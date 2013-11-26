class AddUserIdToUserSubscription < ActiveRecord::Migration
  def change
    add_column :user_subscriptions, :user_id, :integer
  end
end
