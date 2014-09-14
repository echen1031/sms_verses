class CreateUserSubscriptions < ActiveRecord::Migration
  def change
    create_table :user_subscriptions do |t|
      t.integer :user_id
      t.string :phone
      t.integer :verse_count
      t.integer :remind_hour

      t.boolean  :send_day_1, default: false, null: false
      t.boolean  :send_day_2, default: false, null: false
      t.boolean  :send_day_3, default: false, null: false
      t.boolean  :send_day_4, default: false, null: false
      t.boolean  :send_day_5, default: false, null: false
      t.boolean  :send_day_6, default: false, null: false
      t.boolean  :send_day_7, default: false, null: false

      t.string   :phone_carrier"

      t.timestamps
    end
  end
end
