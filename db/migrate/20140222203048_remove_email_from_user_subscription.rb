class RemoveEmailFromUserSubscription < ActiveRecord::Migration
  def up
  	remove_column :user_subscriptions, :email
  end

  def down
  end
end
