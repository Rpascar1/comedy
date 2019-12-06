class JokesController < ApplicationController

  before_action :set_joke, only: [:edit, :joke, :update, :destroy]

  def new
    @joke = Joke.new
  end

  def edit
  end

  def index
    @jokes = Joke.all
  end

  def show
  end

  # def joke
  #
  # end

  def create
#render plain: params[:joke].inspect

    @joke = Joke.new(joke_params)
    @joke.save
    redirect_to jokes_show(@joke)

    # if @joke.valid? && @joke.save
    #   redirect_to joke_path(@joke)
    # else
    #   render :new
    # end
  end

  def update
    if @joke.update(joke_params)
      redirect_to joke_path(@joke)
    else
      render :edit
    end
  end

  def destroy
    @joke.destroy
    redirect_to jokes_path
  end



private

    def set_joke
      @joke = Joke.find_by(params[:id])
    end

    def joke_params
      params.require(:joke).permit(:topic, :body)
    end


end
