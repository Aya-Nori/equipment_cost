class Equipment < ApplicationRecord
  validates :equipment_name, presence: true
  validates :category, presence: true
  validates :price, presence: true

  has_many :start_finish_times
  belongs_to :user

end