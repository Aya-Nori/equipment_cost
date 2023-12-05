class EquipmentsController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def new
    @equipment = Equipment.new
  end

  def show
    @equipment = Equipment.find(params[:id])
    @start_finish_time = @equipment.start_finish_times.find_by(equipment_id: @equipment.id)
    @user = @equipment.user
  end

  def create
    Equipment.create(equipment_params)
    redirect_to '/'
  end

  def start_analysis
    @equipment = Equipment.find(params[:id])
    start_finish_time = @equipment.start_finish_times.build(
      start_time: Time.current,
      condition: 1,
      user: current_user
    )
    
    if start_finish_time.save
      flash[:success] = '分析を開始しました。'
    else
      flash[:error] = '分析の開始に失敗しました。'
    end
  
    redirect_to @equipment
  end
  
  def finish_analysis
    @equipment = Equipment.find(params[:id])
    start_finish_time = @equipment.start_finish_times.build(
      finish_time: Time.current,
      condition: 0,
      user: current_user
    )
    
    if start_finish_time.save
      flash[:success] = '分析を終了しました。'
    else
      flash[:error] = '分析の終了に失敗しました。'
    end
  
    redirect_to @equipment
  end


  private
  def equipment_params
    params.require(:equipment).permit(:equipment_name, :category, :price)
  end

end
