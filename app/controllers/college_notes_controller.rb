class CollegeNotesController < ApplicationController
  # GET /college_notes
  # GET /college_notes.xml
  def index
    @college_notes = CollegeNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @college_notes }
    end
  end

  # GET /college_notes/1
  # GET /college_notes/1.xml
  def show
    @college_note = CollegeNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @college_note }
    end
  end

  # GET /college_notes/new
  # GET /college_notes/new.xml
  def new
    @college_note = CollegeNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @college_note }
    end
  end

  # GET /college_notes/1/edit
  def edit
    @college_note = CollegeNote.find(params[:id])
  end

  # POST /college_notes
  # POST /college_notes.xml
  def create
    @college_note = CollegeNote.new(params[:college_note])

    respond_to do |format|
      if @college_note.save
        format.html { redirect_to(@college_note, :notice => 'College note was successfully created.') }
        format.xml  { render :xml => @college_note, :status => :created, :location => @college_note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @college_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /college_notes/1
  # PUT /college_notes/1.xml
  def update
    @college_note = CollegeNote.find(params[:id])

    respond_to do |format|
      if @college_note.update_attributes(params[:college_note])
        format.html { redirect_to(@college_note, :notice => 'College note was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @college_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /college_notes/1
  # DELETE /college_notes/1.xml
  def destroy
    @college_note = CollegeNote.find(params[:id])
    @college_note.destroy

    respond_to do |format|
      format.html { redirect_to(college_notes_url) }
      format.xml  { head :ok }
    end
  end
end
