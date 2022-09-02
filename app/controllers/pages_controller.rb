class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @wastes = Waste.all
  end

  def dashboard
    @user = current_user
    @bookmarked_wastes = @user.bookmarked_wastes
  end
end
