class AddPhoneCarrierToUser < ActiveRecord::Migration
  def change
    add_column :users, :verse_count, :integer
    add_column :users, :remind_hour, :integer 
    
    add_column :users, :phone_carrier, :string
  end
end
