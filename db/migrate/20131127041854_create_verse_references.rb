class CreateVerseReferences < ActiveRecord::Migration
  def change
    create_table :verse_references do |t|
      t.string :book
      t.integer :chapter
      t.integer :verse_number
      t.string :content

      t.timestamps
    end
  end
end
