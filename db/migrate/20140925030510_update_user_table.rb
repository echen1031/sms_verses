class UpdateUserTable < ActiveRecord::Migration
  def change
    change_column :users, :send_day_1, :boolean, :default => false, :null => false
    change_column :users, :send_day_2, :boolean, :default => false, :null => false
    change_column :users, :send_day_3, :boolean, :default => false, :null => false
    change_column :users, :send_day_4, :boolean, :default => false, :null => false
    change_column :users, :send_day_5, :boolean, :default => false, :null => false
    change_column :users, :send_day_6, :boolean, :default => false, :null => false
    change_column :users, :send_day_7, :boolean, :default => false, :null => false
  end
end
