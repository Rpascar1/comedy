# frozen_string_literal: true

class ShowsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # SET EXCEPTION SO ALL SHOWS CAN BE VIEWED BY NON USERS
  before_action :set_show, only: %i[show update destroy edit]

  def index

    if params[:club_id].present?

      if logged_in?
        @club = Club.find_by_id(params[:club_id])
        @shows = current_user.shows.filter_by_club(params[:club_id])
      else
        @shows = Show.all.filter_by_club(params[:club_id])
        end
      else
        @shows = if logged_in?
                 current_user.shows
           else
                 Show.all
               end
     end
  end

  def new
    @show = if @club = Club.find_by_id(params[:club_id])
              @club.shows.build
            else
              Show.new
            end
  end

  def create
    @show = current_user.shows.build(show_params)
    if @show.save
      flash[:notice] = 'Your Show has been stored in the vault.'
      redirect_to show_path(@show)
    else
      render :new
    end
  end

  def show
    @show = current_user.shows.find(params[:id])
  end

  # def edit
  # EXITS IN ROUTE ONLY NEEDED TO RENDER VIEW NO LOGIC
  # end

  def update
    if @show.user_id = current_user.id
      redirect_to show_path(@show) if @show.update(show_params)
    else
      render :edit

  end
  end

  def destroy
    @show.destroy
    redirect_to shows_path
  end

    private

  def set_show
    @show = Show.find_by(params[:id])
  end

  def show_params
    params.require(:show).permit(:name, :date, :club_id)
  end
  end
