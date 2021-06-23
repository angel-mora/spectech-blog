class ApplicationController < ActionController::Base
  helper_method :set_current_user
  before_action :create_categories_buttons

  def set_current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    else
      @current_user = nil
    end
  end

  def authenticate_user
    flash[:alert] = 'Please login!'
    redirect_to sessions_path if session[:id].nil?
  end

  def create_categories_buttons
    @top_categories = Category.order(:priority).limit(5)
  end
end
