class StartFinishTime < ApplicationRecord
  validates :start_time, presence: false
  validates :finish_time, presence: false
  validates :condition, presence: true

  belongs_to :user
  belongs_to :equipment

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

end