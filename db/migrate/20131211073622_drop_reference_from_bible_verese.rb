class DropReferenceFromBibleVerese < ActiveRecord::Migration
  def up
  	remove_column :bible_verses, :reference
  end

  def down
  end
end
