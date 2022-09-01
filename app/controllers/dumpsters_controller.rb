class DumpstersController < ApplicationController
  def index
    @dumpsters = Dumpster.all
  end

  def show
  end
end
