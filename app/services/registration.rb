class Registration

  def self.new_account(attrs)
    user = User.create!({
      email: attrs[:email],
      username: attrs[:username],
      name: attrs[:name],
      location: attrs[:location],
      dp: attrs[:dp]
    })

    user.credentials.create!({
      provider: attrs[:provider],
      uid: attrs[:uid],
      token: attrs[:token],
      username: attrs[:oauth_username]
    })

    user
  end

end
