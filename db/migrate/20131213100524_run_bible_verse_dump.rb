class RunBibleVerseDump < ActiveRecord::Migration
  def up
  	BibleVerse.delete_all
  	sql = ""
  	source = File.new("db/bible_verses.sql", "r")
  	while (line = source.gets)
    	sql << line; nil
  	end
	  source.close
	  execute sql; nil
  end

  def down
  end
end
