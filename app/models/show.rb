class Show < ApplicationRecord

  validates :date, presence: true
  validates :name, presence: true



  belongs_to :user
  belongs_to :club

end
