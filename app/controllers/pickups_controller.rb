class PickupsController < ApplicationController
  def new
  end

  def create
    @pickup = Pickup.new(pickup_params)
  end

  private

  def pickup_params
    params.require(:pickup).permit(:name, :description)
  end
end
