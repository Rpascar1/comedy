class ShowsController < ApplicationController
before_action :authenticate_user!, except: [:index]
  before_action :set_show, only: [:show, :update, :destroy, :edit]

    def index
      if params[:club_id]
        @shows = Club.find_by_id(params[:club_id]).shows
      else
      @shows = Show.all
    end

    end

    def new
      @show = Show.new
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

    def edit
    end

    def update
      if @show.update(show_params)
        redirect_to show_path(@show)
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
