class AddLanguageToBibleVerses < ActiveRecord::Migration
  def change
    add_column :bible_verses, :language, :string, :default => 'en'
  end
end
