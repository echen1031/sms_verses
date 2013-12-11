class ChangeContentBibleVerses < ActiveRecord::Migration
  def up
  	change_column :bible_verses, :content, :text
  end

  def down
  end
end
