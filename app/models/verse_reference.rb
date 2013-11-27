class VerseReference < ActiveRecord::Base
  attr_accessible :book, :chapter, :content, :verse_number
end
