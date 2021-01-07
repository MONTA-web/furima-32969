FactoryBot.define do
  factory :item_order do
    postal_code      {"123-4567"}
    prefecture_id    { 3 }
    city             {"名古屋市"}
    house_number     {"桜木町1-2"}
    building_name    {"青山103"}
    phone            {"09012341234"}
    token            {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item
  end
end
