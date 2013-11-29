require 'csv'

class BibleVerse < ActiveRecord::Base
  paginates_per 50

  attr_accessible :book, :chapter_num, :content, :verse_num, :book_num, :reference
  validates_presence_of :book, :chapter_num, :content, :verse_num, :book_num, :reference
  validates_numericality_of :chapter_num, :verse_num, :book_num

  def self.load_from_file
  	CSV.foreach("config/fixtures/verses.txt", {:col_sep => "\t", :headers => true}) do |row|
  		verse_hash = row.to_hash.reject{|k,v|['REFID', 'memorize'].include? k}
  		BibleVerse.create(verse_hash)  		
	  end
  end

  def self.random
    BibleVerse.offset(rand(BibleVerse.count)).first
  end

  def text_message
    reference+' - '+content
  end
end

