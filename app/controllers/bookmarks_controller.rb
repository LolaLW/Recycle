class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @user = current_user
    @bookmarked_wastes = @user.bookmarked_wastes
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
    redirect_to wastes_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:waste_id)
  end
end
