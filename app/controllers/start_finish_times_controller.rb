class StartFinishTimesController < ApplicationController

  def index
    @divisions = User.pluck(:division).uniq
    selected_division = params[:selected_division]

    if selected_division.present?
      @start_finish_times = StartFinishTime.joins(:user).where(users: { division: selected_division })
      @selected_division = params[:selected_division]
    else
      @start_finish_times = StartFinishTime.all
    end
  end

  def total_calc_price
    total_calc_price = 0

    # @start_finish_times が nil の場合はメソッドを実行しない
    return total_calc_price unless @start_finish_times

    @start_finish_times.each_with_index do |n, index|
      if @start_finish_times[index + 1].finish_time.present?
        calc_seconds = (@start_finish_times[index + 1].finish_time - n.start_time).to_i
        calc_hours = (calc_seconds / 3600.0).ceil
        calc_price = calc_hours * n.equipment.price
        total_calc_price += calc_price
      end
    end

    return total_calc_price
  end

def chart_data
  # データベースから取得した利用料金データを年ごとにグループ化し、その合計を計算する
  data = StartFinishTime.group_by_year(:start_time).sum(:total_calc_price)

  # データのフォーマットを調整し、[年, 利用料金]の配列の形にする
  formatted_data = data.map { |year, price| [year, price] }

  # フォーマット済みのデータをJSON形式でレスポンスとして返す
  render json: formatted_data
end


end
