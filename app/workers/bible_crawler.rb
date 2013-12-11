require 'nokogiri'
require 'open-uri'

class BibleCrawler
  include Sidekiq::Worker
  URL = 'http://online.recoveryversion.org'

  def perform
    BibleCrawler::old_testament
    BibleCrawler::new_testament    
  end

  def self.new_testament
    first_chapter = 1
    last_chapter = 260
    
    chapter_count = 1
    verse_count = 1
    (first_chapter..last_chapter).each do |chapter|
      puts chapter_count
      puts verse_count

      doc = Nokogiri::HTML(open(URL+'/BibleChapters.asp?fcid='+chapter.to_s+'&lcid='+chapter.to_s))
      b = doc.css('select').first.children.select{|o|o.attributes['selected']}.first.content

      c=nil
      unless doc.css('chapter').empty?
        /CHAPTER (\d{1,3})/i.match(doc.css('chapter').first.content)
        c= $1
      end

      doc.css('#content p.verses').each do |entry|
        v = entry.css('b.versenum').children.first.content.to_i
        bible_verse = BibleVerse.find_or_initialize_by_testament_and_book_and_chapter_num_and_verse_num(
            :testament => 'old', 
            :book => b, 
            :chapter_num => c, 
            :verse_num => v)
        bible_verse.content = entry.children.map{|c|c.content}.drop(1).reject{|c|/^[0-9a-z]$/.match(c)}.join('').strip!
        bible_verse.save
        verse_count += 1
      end
      chapter_count += 1
    end
  end

  def self.old_testament
    first_chapter = 261
    last_chapter = 1189
    chapter_count = 1
    verse_count = 1
    (first_chapter..last_chapter).each do |chapter|
      puts chapter_count
      puts verse_count

      doc = Nokogiri::HTML(open(URL+'/BibleChapters.asp?fcid='+chapter.to_s+'&lcid='+chapter.to_s))
      b = doc.css('.book').last.children.first.content

      c=nil
      unless doc.css('.chapter').empty?
        /CHAPTER (\d{1,3})/i.match(doc.css('.chapter').first.content)
        c= $1
      end

      doc.css('#content p.verses').each do |entry|
        v = entry.css('b.versenum').children.first.content.to_i
        bible_verse = BibleVerse.find_or_initialize_by_testament_and_book_and_chapter_num_and_verse_num(
            :testament => 'new', 
            :book => b, 
            :chapter_num => c, 
            :verse_num => v)
        bible_verse.content = entry.children.map{|c|c.content}.drop(1).reject{|c|/^[0-9a-z]$/.match(c)} .join('').strip!

        bible_verse.save
        verse_count += 1
      end
      chapter_count += 1
    end
  end    
end