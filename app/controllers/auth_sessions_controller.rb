class AuthSessionsController < ApplicationController

  def callback
    if user = User.joins(:credentials).where(credentials: {provider: auth_hash['provider'], uid: auth_hash['uid']}).first
      session[:user_id] = user.id
      redirect_to root_path
    else
      session[:pending_user] = {
        email: github['email'],
        username: github['login'],
        name: github['name'],
        location: github['location'],
        dp: github['avatar_url'],
        provider: 'github',
        uid: github['id'],
        token: auth_hash['credentials']['token'],
        oauth_username: github['login']
      }

      redirect_to register_step1_path
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def github
    auth_hash['extra']['raw_info']
  end

end
