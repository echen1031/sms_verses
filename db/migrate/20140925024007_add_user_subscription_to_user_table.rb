class AddUserSubscriptionToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :send_day_1, :boolean, :default => false, :null => false
    add_column :users, :send_day_2, :boolean, :default => false, :null => false
    add_column :users, :send_day_3, :boolean, :default => false, :null => false
    add_column :users, :send_day_4, :boolean, :default => false, :null => false
    add_column :users, :send_day_5, :boolean, :default => false, :null => false
    add_column :users, :send_day_6, :boolean, :default => false, :null => false
    add_column :users, :send_day_7, :boolean, :default => false, :null => false
  end
end
