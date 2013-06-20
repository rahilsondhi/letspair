class TopicsController < ApplicationController

  def search
    @topics = Topic.tire.search(params[:q]).results
  end

end
