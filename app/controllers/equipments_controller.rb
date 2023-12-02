class EquipmentsController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def new
    @equipment = Equipment.new
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def create
    Equipment.create(equipment_params)
    redirect_to '/'
  end

  private
  def equipment_params
    params.require(:equipment).permit(:equipment_name, :category, :price)
  end

end
