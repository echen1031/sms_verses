class AddPhoneCarrierIdToUserSubscription < ActiveRecord::Migration
  def change
    add_column :user_subscriptions, :phone_carrier_id, :integer
    remove_column :user_subscriptions, :phone_carrier
  end
end
