class Show < ApplicationRecord
  validates :date, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :club

  def self.filter_by_club(id)
    where(club_id: id)
  end

  def self.get_shows_index(user, params)
    if params[:club_id]
      @shows = Show.all.filter_by_club(params[:club_id])
    elsif user
      @shows = user.shows
    else
      @shows = Show.all
    end
  end
   
end
