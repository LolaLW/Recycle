class BookmarksController < ApplicationController
  def index
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
  end
end
