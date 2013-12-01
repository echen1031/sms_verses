class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
  	@verse = BibleVerse::random
  end
end

