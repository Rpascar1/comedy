class ClubsController < ApplicationController
before_action :authenticate_user!, except: [:index]
  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find_by(params[:id])
  end

end
