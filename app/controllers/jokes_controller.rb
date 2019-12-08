# frozen_string_literal: true

class JokesController < ApplicationController
#before_action :authenticate_user!, only:[:index,:new,:edit,:update,:destroy,:show]
#before_action :authenticate_user!
before_action :set_joke, only: [:show, :update, :destroy, :edit]
#before_action :require_user, only:[:new,:edit,:update,:destroy,:show]
#BEFORE ACTION
  def index
    @jokes = current_user.jokes
    #THE INDEX WILL USE ONLT THE USERS JOKES
  end

  def new
    @joke = Joke.new
    #SETS NEW JOKE INSTANCE
  end

  def create
    @joke = current_user.jokes.build(joke_params)
    #USE BUILD TO SET AS PART OF DB CREATING OBJECT
    if @joke.save
      #SAVE AND IF TRUE DO THIS
      flash[:notice] = 'Your comedy gold has been stored in the vault.'
      redirect_to joke_path(@joke)
    else
      #ELSE DO THIS
      render :new
    end
  end

  # def show
  #EXITS IN ROUTE ONLY NEEDED TO RENDER VIEW NO LOGIC
  # end

  # def edit
  #EXITS IN ROUTE ONLY NEEDED TO RENDER VIEW NO LOGIC
  # end

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
    @joke = current_user.jokes.find_by_id(params[:id])
  end

  def joke_params
    params.require(:joke).permit(:topic, :body)
  end

end
