class AddSmsIdToUserSubscription < ActiveRecord::Migration
  def change
    add_column :user_subscriptions, :sms_id, :string
  end
end
