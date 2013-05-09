Fabricator :user do
  email { |attrs| Faker::Internet.email(attrs[:name]) }
  username { |attrs| Faker::Internet.user_name(attrs[:name]) }
  name { Faker::Name.name }
  location { Faker::Address.city }
  dp { Faker::Internet.url }
  timezone { 'Eastern Time (US & Canada)' }
end
