class BibleVersesController < ApplicationController
  # GET /bible_verses
  # GET /bible_verses.json
  def index
    @bible_verses = BibleVerse.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bible_verses }
    end
  end

  # GET /bible_verses/1
  # GET /bible_verses/1.json
  def show
    @bible_verse = BibleVerse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bible_verse }
    end
  end

  # GET /bible_verses/new
  # GET /bible_verses/new.json
  def new
    @bible_verse = BibleVerse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bible_verse }
    end
  end

  # GET /bible_verses/1/edit
  def edit
    @bible_verse = BibleVerse.find(params[:id])
  end

  # POST /bible_verses
  # POST /bible_verses.json
  def create
    @bible_verse = BibleVerse.new(params[:bible_verse])

    respond_to do |format|
      if @bible_verse.save
        format.html { redirect_to @bible_verse, notice: 'Bible verse was successfully created.' }
        format.json { render json: @bible_verse, status: :created, location: @bible_verse }
      else
        format.html { render action: "new" }
        format.json { render json: @bible_verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bible_verses/1
  # PUT /bible_verses/1.json
  def update
    @bible_verse = BibleVerse.find(params[:id])

    respond_to do |format|
      if @bible_verse.update_attributes(params[:bible_verse])
        format.html { redirect_to @bible_verse, notice: 'Bible verse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bible_verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bible_verses/1
  # DELETE /bible_verses/1.json
  def destroy
    @bible_verse = BibleVerse.find(params[:id])
    @bible_verse.destroy

    respond_to do |format|
      format.html { redirect_to bible_verses_url }
      format.json { head :no_content }
    end
  end
end
