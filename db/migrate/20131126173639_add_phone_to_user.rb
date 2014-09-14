class AddPhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :time_zone, :string
    add_column :users, :latitude, :string
    add_column :users, :longitude, :string    
  end
end
