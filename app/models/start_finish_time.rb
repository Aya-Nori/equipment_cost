class StartFinishTime < ApplicationRecord
  validates :start_time
  validates :finish_time
  validates :condition, presence: true

  belongs_to :user
  belongs_to :equipment

end