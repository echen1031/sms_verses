class CreatePhoneCarriers < ActiveRecord::Migration
  def change
    create_table :phone_carriers do |t|
      t.string :name
      t.string :email_format

      t.timestamps
    end
  end
end
