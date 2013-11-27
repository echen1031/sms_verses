require 'csv'

class BibleVerse < ActiveRecord::Base
  attr_accessible :book, :chapter_num, :content, :verse_num, :book_num, :reference
  validates_presence_of :book, :chapter_num, :content, :verse_num, :book_num, :referece
  validates_numericality_of :chapter_num, :verse_num, :book_num

  def self.load_from_fixture
  	CSV.foreach("config/fixtures/verses.txt", {:col_sep => "\t"}) do |row|
  		binding.pry  		
	end
  end
end

