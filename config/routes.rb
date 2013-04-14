Hackerhero::Application.routes.draw do
  # Prototype
  %w[search].each do |page|
    get page => "prototype##{page}"
  end

  root to: 'pages#home'
end
