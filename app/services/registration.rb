class Registration

  # This is just a simple `new` and `save`, but we may
  # want to do things like downcase attributes or create a
  # delayed job or something.
  def self.new_account(attrs={})
    user = User.new({
      email: attrs[:email],
      username: attrs[:username],
      name: attrs[:name],
      location: attrs[:location],
      dp: attrs[:dp],
      credentials_attributes: [
        {
          provider: attrs[:provider],
          uid: attrs[:uid],
          token: attrs[:token],
          username: attrs[:oauth_username]
        }
      ]
    })
    user.save
    user
  end

end
