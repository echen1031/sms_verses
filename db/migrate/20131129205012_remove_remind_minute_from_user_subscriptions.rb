class RemoveRemindMinuteFromUserSubscriptions < ActiveRecord::Migration
  def up
    remove_column :user_subscriptions, :remind_minute
    remove_column :user_subscriptions, :verse_count
  end

  def down
  end
end
