class ChangeBibleVerses < ActiveRecord::Migration
  def up
  	change_column :bible_verses, :testament, :string
  end

  def down
  end
end
