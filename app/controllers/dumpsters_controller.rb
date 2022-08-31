class DumpstersController < ApplicationController
  def index
    @dumpster = Dumpster.all
  end

  def show
  end
end
