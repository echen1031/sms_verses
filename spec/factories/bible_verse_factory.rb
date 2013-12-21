FactoryGirl.define do
	factory :bible_verse do
    sequence(:version) {|n| BibleVerse::VERSIONS[n%3]}
    sequence(:testament) {|n| BibleVerse::TESTAMENTS[n%2]}
    sequence(:book) {|n| BibleVerse::EN_BOOKS[n%66]}
    sequence(:book_num) { |n| n % 66 }
    sequence(:chapter_num) { |n| n % 100 }
    sequence(:verse_num) { |n| n % 100 }
  	content "blah adjahfksdjf asdjhfakjsdhf ljashdkfjh"
  	sequence(:selected) { |n| n % 2 == 0 ? true : false }
  	char_count 100
  	language 'en'
  end
end