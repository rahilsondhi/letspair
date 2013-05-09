class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def ensure_logged_in
    raise Pair::NotLoggedIn.new unless current_user
  end

  rescue_from Pair::NotLoggedIn do |e|
    raise e if Rails.env.test?
    redirect_to root_path
  end

end
