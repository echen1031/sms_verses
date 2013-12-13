class AddPhoneCarrierToUserSubscription < ActiveRecord::Migration
  def change
    add_column :user_subscriptions, :phone_carrier, :string
  end
end
