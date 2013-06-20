Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Settings.github.app_id, Settings.github.app_secret, scope: 'user:email'
end
