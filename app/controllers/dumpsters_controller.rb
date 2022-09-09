class DumpstersController < ApplicationController
  # before_action :set_dumpster, only: %i[index show]

  def index
    @dumpsters = Dumpster.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @dumpsters.geocoded.map do |dumpster|
      {
        lat: dumpster.latitude,
        lng: dumpster.longitude,
        info_window: render_to_string(partial: "info_window", locals: {dumpster: dumpster})
      }
    end
  end

  def show
  end

  # private

  # def set_dumpster
  #   @dumpsters = Dumpster.find(params[:id])
  # end
end
