FactoryBot.define do
  factory :item do
    product_name {"オムライス"}
    description {Faker::Lorem.sentence}
    category_id { 1 }
    condition_id { 1 }
    shipping_charge_id { 1 }
    prefecture_id { 1 }
    deadline_id { 1 }
    price { 77000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/tedy_image.jpg'),filename: 'tedy_image.jpg')
    end
  end
end
