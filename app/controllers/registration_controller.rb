class RegistrationController < ApplicationController

  def step1
    @pending_user = session[:pending_user]
  end

end
