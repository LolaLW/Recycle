class BookmarksController < ApplicationController
  def index
    @bookmark = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
  end
end
