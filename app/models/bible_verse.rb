require 'csv'

class BibleVerse < ActiveRecord::Base
  paginates_per 50

  VERSIONS = ['recovery', 'darby', 'kjv']
  
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
  
  attr_accessible :version, :testament, :book, :book_num, :chapter_num, :verse_num, 
                :content, :selected, :char_num

  scope :selected, where(:selected => true)
  scope :ordered, order(' bible_verses.book_num asc, 
                          bible_verses.chapter_num asc, 
                          bible_verses.verse_num asc')

  validates_presence_of :book, :chapter_num, :content, :verse_num, :book_num
  validates_numericality_of :chapter_num, :verse_num, :book_num
  validates :testament, inclusion: { in: ['new', 'old']}
  #validates_uniqueness_of :verse_num,  scope => [:book_num, :chapter_num]

  before_validation :set_book_num

  def self.random
    BibleVerse.selected.offset(rand(BibleVerse.selected.count)).first
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
  
  def self.write_selected_to_file
    CSV.open("config/fixtures/verses.csv", "w") do |csv|
      BibleVerse.selected.ordered.each do |v|
        csv << [v.book, v.chapter_num, v.verse_num].map(&:to_s)
      end
    end
  end

  def self.load_selected_from_file
    BibleVerse.update_all(selected: false)
    CSV.foreach("config/fixtures/verses.csv") do |row|
      bible_verse = BibleVerse.find_or_initialize_by_book_and_chapter_num_and_verse_num(
            :book => row[0], :chapter_num => row[1], :verse_num => row[2])    
      bible_verse.update_attributes(selected: true) 
    end    
  end
end

