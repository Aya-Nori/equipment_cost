class StartFinishTime < ApplicationRecord
  validates :start_time, presence: false
  validates :finish_time, presence: false
  validates :condition, presence: true

  belongs_to :user
  belongs_to :equipment

  def total_calc_price
    # ここに計算ロジックを追加する
    # 例: 仮に利用料金が「usage_fee」というカラムに保存されている場合
    usage_fee
  end


end