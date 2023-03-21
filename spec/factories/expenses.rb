FactoryBot.define do
  factory :expense do
    name { "MyString" }
    amount { "9.99" }
    user { nil }
    category { nil }
  end
end
