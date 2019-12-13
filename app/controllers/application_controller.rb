# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:home] 

  before_action :logged_in?

  helper_method :current_user, :logged_in?


  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:danger] = "You must be loogged in to perform that action"
      redirect_to root_path
    end
  end

  private

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
