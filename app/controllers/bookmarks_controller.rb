class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.waste = Waste.find(params[:waste_id])
    @bookmark.save!
    redirect_to wastes_path
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:waste_id)
  end
end
