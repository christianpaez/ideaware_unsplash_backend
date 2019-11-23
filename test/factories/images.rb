FactoryBot.define do
  factory :image do
    unsplash_id { Faker::Internet.uuid }
    description { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    html { Faker::Internet.url  }
  end
end
