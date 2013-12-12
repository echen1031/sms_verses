require 'csv'

class BibleVerse < ActiveRecord::Base
  paginates_per 50

  BOOKS = ['Genesis', 'Exodus', 'Leviticus', 'Numbers', 'Deuteronomy', 
    'Joshua', 'Judges', 'Ruth', '1 Samuel', '2 Samuel', '1 Kings', '2 Kings', '1 Chronicles', '2 Chronicles', 
    'Ezra', 'Nehemiah', 'Judith', 'Esther', 'Job', 'Psalms', 'Proverbs', 'Ecclesiastes', 'Song of Songs', 
    'Isaiah', 'Jeremiah', 'Lamentations', 'Ezekiel', 'Daniel', 
    'Hosea', 'Joel', 'Amos', 'Obadiah', 'Micah', 'Nahum', 'Habakkuk', 'Zephaniah', 'Haggai', 'Zechariah', 'Malachi',
    'Matthew', 'Mark', 'Luke', 'John', 'Acts', 
    'Romans', '1 Corinthians', '2 Corinthians', 'Galatians', 'Ephesians', 'Philippians', 'Colossians', 
    '1 Thessalonians', '2 Thessalonians', '1 Timothy', '2 Timothy', 
    'Titus', 'Philemon', 'Hebrews', 'James',  '1 Peter', '2 Peter', '1 John', '2 John', '3 John', 'Jude', 
    'Revelation']
  
  attr_accessible :book, :chapter_num, :content, :verse_num, :book_num, :testament, :selected, :version
  validates_presence_of :book, :chapter_num, :content, :verse_num, :book_num
  validates_numericality_of :chapter_num, :verse_num, :book_num
  validates :testament, inclusion: { in: ['new', 'old']}
  #validates_uniqueness_of :verse_num,  scope => [:book_num, :chapter_num]

  before_validation :set_book_num

  def self.load_from_file
  	CSV.foreach("config/fixtures/verses.txt", {:col_sep => "\t", :headers => true}) do |row|
  		verse_hash = row.to_hash.reject{|k,v|['REFID', 'memorize'].include? k}
      bible_verse = BibleVerse.find_or_initialize_by_testament_and_book_and_chapter_num_and_verse_num(
            :book_num => verse_hash['book_num'], 
            :chapter_num => verse_hash['chapter_num'], 
            :verse_num => verse_hash['verse_num'])
      bible_verse.update_attributes(selected: true)
	  end
  end

  def self.random
    BibleVerse.offset(rand(BibleVerse.count)).first
  end

  def reference 
    book+" "+chapter_num.to_s+":"+verse_num.to_s
  end

  def text_message
    reference+' - '+content
  end

  def book_to_index
    return @book_to_index unless @book_to_index.nil? or @book_to_index.empty?
    @book_to_index = Hash[BOOKS.zip(BOOKS.each_index.map(&1.method(:+)))]    
  end

  def set_book_num
    self.chapter_num = 1 if chapter_num.nil?
    self.book_num = book_to_index[book]    
  end
end

