class AddDayAndTimezoneToUserSubscriptions < ActiveRecord::Migration
  def change
    add_column :user_subscriptions, :send_day_1, :boolean
    add_column :user_subscriptions, :send_day_2, :boolean
    add_column :user_subscriptions, :send_day_3, :boolean
    add_column :user_subscriptions, :send_day_4, :boolean
    add_column :user_subscriptions, :send_day_5, :boolean
    add_column :user_subscriptions, :send_day_6, :boolean
    add_column :user_subscriptions, :send_day_7, :boolean
    add_column :user_subscriptions, :time_zone, :string
  end
end
