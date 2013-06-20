class NeedsController < ApplicationController
  before_filter :ensure_logged_in
  respond_to :json

  def index
    respond_with current_user.needs # TODO: Use rabl here
  end

  def create
    attrs = {
      date_type: params[:date_type],
      description: params[:description],
      date_suggested_one: params[:date_suggested_one],
      date_suggested_two: params[:date_suggested_two],
      date_suggested_three: params[:date_suggested_three]
    }
    if @need = current_user.needs.create(attrs)
      respond_with @need, status: :created
    else
      respond_with @user, status: :unprocessable_entity
    end
  end

end
