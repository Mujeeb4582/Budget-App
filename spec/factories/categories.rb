FactoryBot.define do
  factory :category do
    sequence(:name) { |n| Faker::Lorem.unique.word.chars.first(3).join + n.to_s }
    # icon { Faker::Lorem.word }
    sequence(:icon) { |n| Category::ICONS[n % Category::ICONS.length] }
    user
  end
end
