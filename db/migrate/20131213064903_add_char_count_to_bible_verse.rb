class AddCharCountToBibleVerse < ActiveRecord::Migration
  def change
    add_column :bible_verses, :char_count, :integer
  end
end
