class StartFinishTimesController < ApplicationController
  def index
    @equipment = Equipment.find(params[:id])
    @start_finish_time = @equipment.start_finish_times.find_by(equipment_id: @equipment.id)
    @user = @equipment.user
  end

end
