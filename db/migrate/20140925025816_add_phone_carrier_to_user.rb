class AddPhoneCarrierToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_carrier, :string
  end
end
