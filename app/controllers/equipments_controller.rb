class EquipmentsController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def show
    @equipments = Equipment.find(params[:id])
  end

end
