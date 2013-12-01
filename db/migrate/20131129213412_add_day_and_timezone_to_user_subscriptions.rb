class AddDayAndTimezoneToUserSubscriptions < ActiveRecord::Migration
  def change
    add_column :user_subscriptions, :send_day_1, :boolean, :null => false, :default => false
    add_column :user_subscriptions, :send_day_2, :boolean, :null => false, :default => false
    add_column :user_subscriptions, :send_day_3, :boolean, :null => false, :default => false
    add_column :user_subscriptions, :send_day_4, :boolean, :null => false, :default => false
    add_column :user_subscriptions, :send_day_5, :boolean, :null => false, :default => false
    add_column :user_subscriptions, :send_day_6, :boolean, :null => false, :default => false
    add_column :user_subscriptions, :send_day_7, :boolean, :null => false, :default => false
    add_column :user_subscriptions, :time_zone, :string
  end
end
