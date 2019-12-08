class ClubsController < ApplicationController
before_action :authenticate_user!, except: [:index]

  def index
    @clubs = Club.all
    #SET THE INSTANCE OF ALL CLUBS
  end

  def show
    #SHOW ACTION SEPARATE FROM THE SHOW CLASS
    @club = Club.find_by(params[:id])
    #SET THE INSTNACE OF CLUB EQUAL TO THE CLUB LISTED IN THE PARAMS BY ID
  end

end
