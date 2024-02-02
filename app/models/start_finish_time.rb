class StartFinishTime < ApplicationRecord
  validates :start_time, presence: false
  validates :finish_time, presence: false
  validates :condition, presence: true
  validates :uused_hour, presence: false
  validates :usage_fee, presence: false

  belongs_to :user
  belongs_to :equipment

end