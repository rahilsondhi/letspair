Hackerhero::Application.routes.draw do
  # Prototype, for development only
  if Rails.env.development?
    %w[search request_to_pair sessions register1 register2].each do |page|
      get page => "prototype##{page}"
    end
  end

  # Landing pages
  root to: 'pages#coming_soon'
  get 'designers-we-need-your-help-with-open-source' => 'pages#designers'
end
