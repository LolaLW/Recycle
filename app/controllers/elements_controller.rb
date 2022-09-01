class ElementsController < ApplicationController
  before_action :set_element, only: %i[edit update destroy]

  def new
    @elements = Element.new
  end

  def create
    @element = Element.new(element_params)
    if @element.save
      redirect_to elements_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @element.update(element_params)
      redirect_to elements_path(@element)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @element.destroy
    redirect_to elements_path, status: :see_other
  end

  private

  def set_element
    @element = Element.find(params[:id])
  end

  def element_params
    params.require(:element).permit(:name)
  end
end
