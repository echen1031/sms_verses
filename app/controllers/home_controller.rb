class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
  	@verse = BibleVerseDecorator.decorate(BibleVerse::random)
  end
end

