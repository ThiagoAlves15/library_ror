FactoryBot.define do
  factory :reserve do
    book
    user
    reserve_date { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    devolution_date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 3) }
  end
end
