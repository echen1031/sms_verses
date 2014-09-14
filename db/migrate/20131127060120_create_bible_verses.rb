class CreateBibleVerses < ActiveRecord::Migration
  def change
    create_table :bible_verses do |t|
      t.string :testament
      t.string :reference
      t.string :book
      t.integer :book_num
      t.integer :chapter_num
      t.integer :verse_num
      t.text :content
      t.string :version
      t.string :language

      t.integer :char_count
      t.boolean :select

      t.timestamps
    end
  end
end
