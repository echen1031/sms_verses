class VerseReferencesController < ApplicationController
  # GET /verse_references
  # GET /verse_references.json
  def index
    @verse_references = VerseReference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @verse_references }
    end
  end

  # GET /verse_references/1
  # GET /verse_references/1.json
  def show
    @verse_reference = VerseReference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @verse_reference }
    end
  end

  # GET /verse_references/new
  # GET /verse_references/new.json
  def new
    @verse_reference = VerseReference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @verse_reference }
    end
  end

  # GET /verse_references/1/edit
  def edit
    @verse_reference = VerseReference.find(params[:id])
  end

  # POST /verse_references
  # POST /verse_references.json
  def create
    @verse_reference = VerseReference.new(params[:verse_reference])

    respond_to do |format|
      if @verse_reference.save
        format.html { redirect_to @verse_reference, notice: 'Verse reference was successfully created.' }
        format.json { render json: @verse_reference, status: :created, location: @verse_reference }
      else
        format.html { render action: "new" }
        format.json { render json: @verse_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /verse_references/1
  # PUT /verse_references/1.json
  def update
    @verse_reference = VerseReference.find(params[:id])

    respond_to do |format|
      if @verse_reference.update_attributes(params[:verse_reference])
        format.html { redirect_to @verse_reference, notice: 'Verse reference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @verse_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verse_references/1
  # DELETE /verse_references/1.json
  def destroy
    @verse_reference = VerseReference.find(params[:id])
    @verse_reference.destroy

    respond_to do |format|
      format.html { redirect_to verse_references_url }
      format.json { head :no_content }
    end
  end
end
