class BibleVersesController < ApplicationController
  def index
    @bible_verses = BibleVerse.page(params[:page]).ordered

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bible_verses }
    end
  end

  def show
    @bible_verse = BibleVerse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bible_verse }
    end
  end  
end
