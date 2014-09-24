namespace :verse do
  desc "Load Bible Verses to Database"
  task load: :environment do
		BibleVerse.delete_all

  	sql = ""
  	source = File.new("db/bible_verses.sql", "r")
  	while (line = source.gets)
    	sql << line; nil
  	end

  	ActiveRecord::Base.connection.execute(sql) 
	  source.close
  end
end