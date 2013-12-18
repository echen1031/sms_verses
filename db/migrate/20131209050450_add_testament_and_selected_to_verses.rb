class AddTestamentAndSelectedToVerses < ActiveRecord::Migration
  def change
    add_column :bible_verses, :testament, :boolean
    add_column :bible_verses, :selected, :boolean
  end
end
