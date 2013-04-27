class AuthSessionsController < ApplicationController

  def create
    github = auth_hash['extra']['raw_info']
    info = {
      uid: github['id'],
      username: github['login'],
      dp: github['avatar_url'],
      name: github['name'],
      location: github['location']
    }
    raise info.inspect
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
