class PagesController < ApplicationController
  
  def home
    
  end

  def coming_soon
    render layout: 'landing'
  end

  def designers
    render layout: 'landing'
  end

end
