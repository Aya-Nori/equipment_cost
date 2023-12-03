class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name_sei, presence: true
  validates :name_mei, presence: true
  validates :extention_number, presence: true
  validates :division, presence: true
  validates :section, presence: true

  has_many :equipments
  has_many :start_finish_times

end
