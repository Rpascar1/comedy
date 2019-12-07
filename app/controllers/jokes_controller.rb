# frozen_string_literal: true

class JokesController < ApplicationController

before_action :set_joke, only: [:show, :update, :destroy, :edit]
  def index
    @jokes = Joke.all
  end

  def new
    @joke = Joke.new
  end

  def create
    @joke = current_user.jokes.build(joke_params)
    if @joke.save

      flash[:notice] = 'Your comedy gold has been stored in the vault.'
      redirect_to joke_path(@joke)
    else
      render :new
    end
  end

  def show
    @joke = current_user.jokes.find(params[:id])
  end

  def edit
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
