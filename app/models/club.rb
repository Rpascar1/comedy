class Club < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true

  has_many :shows
  has_many :users, through: :shows

end
