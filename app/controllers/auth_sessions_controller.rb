class AuthSessionsController < ApplicationController

  def callback
    if user = User.joins(:credentials).where(credentials: {provider: auth_hash['provider'], uid: auth_hash['uid']}).first
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = Registration.new_account(auth_hash)
      session[:user_id] = user.id
      redirect_to register_step1_path
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
