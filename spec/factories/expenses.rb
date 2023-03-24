FactoryBot.define do
  factory :expense do
    # name { Faker::Commerce.product_name }
    sequence(:name) { |n| "#{Faker::Commerce.product_name}-#{n}" }
    amount { Faker::Commerce.price(range: 0..100.0) }
    category
    user
  end
end
