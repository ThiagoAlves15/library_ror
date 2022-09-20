FactoryBot.define do
  factory :reserve do
    book { nil }
    user { nil }
    reserve_date { "2022-09-20 10:03:16" }
    devolution_date { "2022-09-20 10:03:16" }
    status { 1 }
  end
end
