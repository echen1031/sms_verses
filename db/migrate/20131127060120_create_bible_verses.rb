class CreateBibleVerses < ActiveRecord::Migration
  def change
    create_table :bible_verses do |t|
      t.string :reference
      t.string :book
      t.integer :book_num
      t.integer :chapter_num
      t.integer :verse_num
      t.string :content

      t.timestamps
    end
  end
end
