class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

## These are all Read Methods, the Controller appears to be mostly a read program

  def index
    @notes = Note.all 
    ## Shows all pages in the database

  end

  def show
    @notes = Note.find(params[:id])
    ## find a page by the ID passed in
  end

  def new
  @notes = Note.new
  ##Creates a new page in memory that is not yet saved to the db
  end
end

def create
  @note = Note.new(pages_params)
  
  if @note.save
    redirect_to notes_path
  else
    render :new
  end
end

def edit
  @note = Notes.find(params[:id])
  # render :_form #Points to the _form.html.erb form partial or something like that.
end

def update
  @note = Note.find(params[:id])
  if @note.update(page_params)
    redirect_to note_path
  else
    render :edit
  end
end

def destroy
  @note.destroy
  Note.find(params[:id]).destroy
  redirect_to note_path
end


private

  def notes_params 
    params.require(:note).permit(:title, :author, :body)
  end

