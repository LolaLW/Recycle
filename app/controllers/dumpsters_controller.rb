class DumpstersController < ApplicationController
  def index
    @dumpsters = Dumpster.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @dumpsters.geocoded.map do |dumpster|
      {
        lat: dumpster.latitude,
        lng: dumpster.longitude
      }
    end
  end

  def show
  end
end
