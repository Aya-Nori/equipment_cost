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
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to equipments_path
    else
      render 'new'
    end
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


  def start_finish_analysis
    @equipment = Equipment.find(params[:id])
    
    # 開始時間が存在し、かつ終了時間が存在しない行で、user_idがcurrent userと同じ、equipment_idがshow.html.erbのequipmentと同じである行を取得
    start_finish_time = @equipment.start_finish_times
    .where.not(start_time: nil, finish_time: nil, user_id: current_user.id, equipment_id: @equipment.id)
    .order(created_at: :desc)
    .first

    if start_finish_time
      # 計算
      calc_seconds = (Time.current - start_finish_time.start_time).to_i
      calc_hours = (calc_seconds / 3600.0).ceil
      calc_time = Time.at(calc_hours * 3600).utc.strftime("%k")

      fee = @equipment.price * calc_hours

    # 終了ボタンが押された時間を記録
      start_finish_time.update(finish_time: Time.current, condition: 0, user: current_user, used_hour: calc_time, usage_fee: fee)

      flash[:success] = '分析を終了しました。'
    else
      flash[:error] = '対応する開始時間が見つかりませんでした。'
    end
  
    redirect_to @equipment
  end

  private
  def equipment_params
    params.require(:equipment).permit(:equipment_name, :category, :price)
  end

end
