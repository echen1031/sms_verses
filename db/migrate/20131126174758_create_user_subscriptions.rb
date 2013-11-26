class CreateUserSubscriptions < ActiveRecord::Migration
  def change
    create_table :user_subscriptions do |t|
      t.string :email
      t.string :phone
      t.boolean :is_active
      t.datetime :remind_at
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :verse_count

      t.timestamps
    end
  end
end
