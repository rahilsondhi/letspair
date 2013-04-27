Fabricator :user do
  name { Faker::Name.name }
  email { |attrs| Faker::Internet.email(attrs[:name]) }
  username { |attrs| Faker::Internet.user_name(attrs[:name]) }
  timezone { 'Eastern Time (US & Canada)' }
end