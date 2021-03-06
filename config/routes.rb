Hackerhero::Application.routes.draw do
  #
  # Prototype, for development only
  #

  if Rails.env.development?
    %w[search request_to_pair sessions register1 register2 needs explore].each do |page|
      get "prototype/#{page}" => "prototype##{page}"
    end
  end

  #
  # Landing pages
  #

  root to: 'pages#coming_soon'
  get 'designers-we-need-your-help-with-open-source' => 'pages#designers'

  #
  # Omniauth
  #

  get '/auth/:provider/callback', to: 'auth_sessions#callback'

  #
  # Registration
  #

  get '/register/step1' => 'registration#step1', as: 'register_step1'

  #
  # Users
  #

  resources :users

  #
  # Topics
  #

  get '/topics/search' => 'topics#search', as: 'topics_search'

  #
  # Needs
  #

  resources :needs, only: [:create, :index]

  #
  # Backbone routes
  # These routes are defined in Backbone. User might refresh the page and Rails simply
  # needs to render the application layout and let backbone takeover
  #
  ['/post-a-need', '/my-needs'].each do |page|
    get page => 'pages#app'
  end

end
