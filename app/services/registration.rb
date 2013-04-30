class Registration

  def self.new_account(auth_hash)
    github = auth_hash['extra']['raw_info']

    user = User.create!({
      email: github['email'],
      username: github['login'],
      name: github['name'],
      location: github['location'],
      dp: github['avatar_url']
    })

    user.credentials.create!({
      provider: 'github',
      uid: github['id'],
      token: auth_hash['credentials']['token'],
      username: github['login']
    })

    user
  end

end
