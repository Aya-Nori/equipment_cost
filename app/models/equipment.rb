class Equipment < ApplicationRecord
  validates :equipment_name, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: true
end
