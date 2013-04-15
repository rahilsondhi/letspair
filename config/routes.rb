Hackerhero::Application.routes.draw do
  # Prototype, for development only
  if Rails.env.development?
    %w[search].each do |page|
      get page => "prototype##{page}"
    end
  end

  # root to: 'pages#home'

  # Landing page for designers
  root to: 'pages#coming_soon'
  get 'designers-we-need-your-help-with-open-source' => 'pages#designers'
end
