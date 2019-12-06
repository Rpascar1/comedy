class ShowsController < ApplicationController



  before_action :set_show, only: [:edit, :show, :update, :destroy]
  def new
    @show = Show.new
  end

  def edit
  end

  def index
    @shows = Show.all
  end

  def show

  end

  def create
    @show = Show.new(show_params)
    if @show.valid? && @show.save
      redirect_to show_path(@show)
    else
      render :new
    end
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
      params.require(:show).permit(:name,:released,:release_year,:artist_name,:genre)
    end


end
