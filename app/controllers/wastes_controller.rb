class WastesController < ApplicationController
  before_action :set_waste, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query"
      @wastes = Waste.where(sql_query, query: "%#{params[:query]}%")
    else
      @wastes = Waste.all
    end
  end

  def show
    postal_code = current_user.address[/\d{5}/]
    @pickup = Pickup.find_by(name: postal_code)
  end

  def new
    @waste = Waste.new
  end

  def create
    @waste = Waste.new(waste_params)
    if @waste.save
      redirect_to wastes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @waste.update(waste_params)
      redirect_to wastes_path(@waste)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @waste.destroy
    redirect_to wastes_path, status: :see_other
  end

  private

  def set_waste
    @waste = Waste.find(params[:id])
  end

  def waste_params
    params.require(:waste).permit(:name, :description, :barcode)
  end
end
