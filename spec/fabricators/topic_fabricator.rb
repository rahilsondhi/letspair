Fabricator :topic do
  name { sequence(:name) { |i| Faker::Company.bs.split(' ').first + i.to_s } }
end
