class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @waste = Waste.all
  end

  def dashboard
    @user = current_user
  end
end
