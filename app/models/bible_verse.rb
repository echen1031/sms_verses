require 'csv'

class BibleVerse < ActiveRecord::Base
  paginates_per 50

  TESTAMENTS = ['new', 'old']
  VERSIONS = ['recovery', 'darby', 'kjv']  
  EN_BOOKS = ['Genesis', 'Exodus', 'Leviticus', 'Numbers', 'Deuteronomy', 
              'Joshua', 'Judges', 'Ruth', '1 Samuel', '2 Samuel', '1 Kings', '2 Kings', '1 Chronicles', '2 Chronicles', 
              'Ezra', 'Nehemiah', 'Judith', 'Esther', 'Job', 'Psalms', 'Proverbs', 'Ecclesiastes', 'Song of Songs', 
              'Isaiah', 'Jeremiah', 'Lamentations', 'Ezekiel', 'Daniel', 
              'Hosea', 'Joel', 'Amos', 'Obadiah', 'Micah', 'Nahum', 'Habakkuk', 'Zephaniah', 'Haggai', 'Zechariah', 'Malachi',
              'Matthew', 'Mark', 'Luke', 'John', 'Acts', 
              'Romans', '1 Corinthians', '2 Corinthians', 'Galatians', 'Ephesians', 'Philippians', 'Colossians', 
              '1 Thessalonians', '2 Thessalonians', '1 Timothy', '2 Timothy', 
              'Titus', 'Philemon', 'Hebrews', 'James',  '1 Peter', '2 Peter', '1 John', '2 John', '3 John', 'Jude', 
              'Revelation']
  CH_BOOKS = ["創世記", "出埃及記", "利未記", "民數記", "申命記", "約書亞記", "士師記", "路得記",
              "撒母耳記上", "撒母耳記下", "列王紀上", "列王紀下", "歷代志上", "歷代志下",
              "以斯拉記", "尼希米記", "以斯帖記", "約伯記", 
              "詩篇", "箴言", "傳道書", "雅歌", "以賽亞書", "耶利米書", "耶利米哀歌",
              "以西結書", "但以理書", "何西阿書", "約珥書", "阿摩司書", "俄巴底亞書", "約拿書", "彌迦書", 
              "那鴻書", "哈巴谷書", "西番雅書", "哈該書", "撒迦利亞書", "瑪拉基書",
              "馬太福音", "馬可福音", "路加福音", "約翰福音", "使徒行傳", "羅馬書", "哥林多前書", "哥林多後書", 
              "加拉太書", "以弗所書", "腓立比書", "歌羅西書",
              "帖撒羅尼迦前書", "帖撒羅尼迦後書", "提摩太前書", "提摩太後書", "提多書", "腓利門書", 
              "希伯來書", "雅各書", "彼得前書", "彼得後書", "約翰壹書", "約翰貳書", "約翰參書",
              "猶大書", "啟示錄"]

  LANGUAGES = ['en', 'ch']
  
  attr_accessible :version, :testament, :book, :book_num, :chapter_num, :verse_num, 
                  :content, :selected, :char_num, :language

  scope :selected, where(:selected => true)
  scope :ordered, order(' bible_verses.book_num asc, 
                          bible_verses.chapter_num asc, 
                          bible_verses.verse_num asc')

  validates_presence_of :content
  validates_numericality_of :chapter_num, :verse_num, :book_num
  validates :testament, inclusion: { in: TESTAMENTS }
  validates :version, inclusion: { in: VERSIONS }
  validates :book, inclusion: { in: EN_BOOKS + CH_BOOKS }
  validates :language, inclusion: { in: LANGUAGES }
  
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
    self.book_num = book_to_index[self.book] if self.num.nil? and self.book.present?
    self.book = BOOKS[self.book_num-1] if self.book.nil? and self.book_num.present?
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

