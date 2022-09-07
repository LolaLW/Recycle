class DumpstersController < ApplicationController
  def index
    @dumpsters = Dumpster.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @dumpsters.geocoded.map do |dumpster|
      {
        lat: dumpster.latitude,
        lng: dumpster.longitude
        #info_window: render_to_string(partial: "info_window", locals: {flat: flat})
      }
    end
  end

  def show
  end
end
