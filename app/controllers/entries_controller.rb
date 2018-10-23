class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    @comment = Comment.all
  end

  def show
    @entry = Entry.find(params[:id])
    @tags = @entry.tags
    @comment = Comment.where(entry_id: params[:id]) 
  end

  def new
    @tags = Tag.all
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
		@entry.save
		redirect_to @entry
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update(entry_params)
    redirect_to @entry
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to entries_path
  end

  private
  def entry_params
    params.require(:entry).permit(:photo_url, :author, :caption, :date_taken, :tag_ids => [])
  end
end
