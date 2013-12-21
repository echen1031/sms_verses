require 'nokogiri'
require 'open-uri'

class BibleCrawler::RecoveryChCrawler
  include Sidekiq::Worker
  URL = 'http://www.churchinmontereypark.org'

  def perform
    chapters = (1..1189)
    chapters = (1..1)
    language = 'ch'
    version = 'recovery'

    chapters.each do |chapter_num|
      doc = Nokogiri::HTML(open(URL+"/Docs/cnenbible/#{chapter_num}.htm"))
      binding.pry
      title = doc.css('table .title6')[0].text
      book = title.split('-')[0]
      
      doc.css('table')[1].css('td.td').each_with_index do |entry, i|
        if i % 2 == 0
          binding.pry
          reference = entry.text
          (chapter_num, verse_num) = reference.split(':')              
        elsif i % 2 == 1
          binding.pry
          bible_verse = BibleVerse.find_or_initialize_by_version_and_language_and_book_and_chapter_num_and_verse_num(
              :version => version,
              :language => language,
              :book => book,
              :chapter_num => chapter_num,
              :verse_num => verse_num, 
              )
          bible_verse.update_attributes(:testament => testament, 
                                        :content => content, 
                                        :char_count => content.length )          
        end        
      end            
    end
  end  
end