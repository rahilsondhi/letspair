class UsersController < ApplicationController
  respond_to :json

  def create
    pending_user = session[:pending_user]

    @user = Registration.new_account({
      email: params[:email],
      username: params[:username],
      name: params[:name],
      location: params[:location],
      dp: pending_user[:dp],
      provider: pending_user[:provider],
      uid: pending_user[:uid],
      token: pending_user[:token],
      oauth_username: pending_user[:login]
    })

    if @user
      session[:pending_user] = nil
      session[:user_id] = @user.id
      respond_with @user, status: :created
    else
      respond_with @user.errors, status: :unprocessable_entity
    end
  end

end
