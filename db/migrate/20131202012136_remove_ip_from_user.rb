class RemoveIpFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :ip
  end

  def down
  end
end
