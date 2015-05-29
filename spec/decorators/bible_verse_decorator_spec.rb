require 'spec_helper'

describe BibleVerseDecorator do
  let(:bible_verse) { create(:bible_verse, 
                             book: 'Jude', chapter_num: 1, verse_num: 1, content: 'test') }
  let(:decorated_bible_verse ) { BibleVerseDecorator.decorate(bible_verse) }

  it "returns reference" do 
    expect(decorated_bible_verse.reference).to eq 'Jude 1:1'
  end

  it "returns text_message" do 
    expect(decorated_bible_verse.text_message).to eq 'Jude 1:1 - test'
  end  
end
