class Show < ApplicationRecord

  validates :date, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :club


  def self.filter_by_club(id)
       where(club_id: id)
  end

end
