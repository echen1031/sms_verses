class AddVersionToBibleVerses < ActiveRecord::Migration
  def change
    add_column :bible_verses, :version, :string
  end
end
