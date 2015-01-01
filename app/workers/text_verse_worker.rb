class TextVerseWorker
  include Sidekiq::Worker

  def perform(user_id, bible_verse_id)
  	user = User.find(user_id)
  	bible_verse = BibleVerseDecorator.decorate(BibleVerse.find(bible_verse_id))
    raise 'invalid request' if user.nil? or bible_verse.nil?    
    UserMailer.daily_text_message(user, bible_verse).deliver     
  end
end