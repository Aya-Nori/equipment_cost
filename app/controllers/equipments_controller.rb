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

end
