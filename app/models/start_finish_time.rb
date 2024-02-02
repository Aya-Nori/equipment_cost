class StartFinishTime < ApplicationRecord
  validates :start_time, presence: false
  validates :finish_time, presence: false
  validates :condition, presence: true

  belongs_to :user
  belongs_to :equipment

end