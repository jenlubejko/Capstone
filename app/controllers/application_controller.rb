class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_foodie
    @current_foodie ||= Foodie.find_by(id: session[:foodie_id]) if session[:foodie_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_foodie
  end
end