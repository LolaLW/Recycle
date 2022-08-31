class BookmarksController < ApplicationController
  def index
    @bookmark = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end
end
