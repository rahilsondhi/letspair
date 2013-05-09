Fabricator :need do
  date_type { Need::VALID_DATE_TYPES.sample }
  description { Faker::Lorem.sentence(10) }
  date_suggested_one { 1.day.from_now }
  date_suggested_two { 2.days.from_now }
  date_suggested_three { 3.days.from_now }
end
