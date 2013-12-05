class RemoveRemindMinuteFromUserSubscriptions < ActiveRecord::Migration
  def up
    remove_column :user_subscriptions, :remind_at
    remove_column :user_subscriptions, :verse_count
    add_column :user_subscriptions, :remind_hour, :integer
  end

  def down
  end
end
