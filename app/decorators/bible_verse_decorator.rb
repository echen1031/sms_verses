class BibleVerseDecorator < Draper::Decorator
  delegate_all

  def reference 
    book+" "+chapter_num.to_s+":"+verse_num.to_s
  end

  def text_message
    reference+' - '+content
  end
end
