class PagesController < ApplicationController

  # This is for routes that exist in Backbone but not rails.
  # See routes.rb "Backbone routes"
  def app
    render nothing: true, layout: 'application'
  end

  # Landing page
  def home

  end

  # Landing page with wufoo form
  def coming_soon
    render layout: 'landing'
  end

  # Landing page for designers persuading them to use LetsPair
  def designers
    render layout: 'landing'
  end

end
