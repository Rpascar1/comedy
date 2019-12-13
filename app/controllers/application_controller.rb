# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # PROTECTS FROM CROSS SITE REQUEST FORGERY
  before_action :authenticate_user!, except: [:home] #:index,
  # DEVISE HELPER THAT AUTHENTICATIONS USER BEFORE ALL ACTIONS PERFORMED
  # BY ANY CONTROLLER EXCEPT THE :HOME ACTION IN THE PAGES CONTROLLER
  before_action :logged_in?
  # CHECKS TO SEE IF THERE IS A LOGGED IN USER BEFORE ANY ACTION PERFORMED
  # BY A CONTROLLER

  helper_method :current_user, :logged_in?
  # HELPER METHODS ARE MADE AVAILABLE TO VIEWS BY DECLARING THEM HERE

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
