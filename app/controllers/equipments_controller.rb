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

  # def create
  #   Equipment.create(equipment_params)
  #   redirect_to '/'
  # end
  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to '/'
    else
      Rails.logger.error(@equipment.errors.full_messages.to_sentence)
      render :new
    end
  end

  private
  def equipment_params
    params.require(:equipment).permit(:equipment_name, :category, :price)
  end

end
