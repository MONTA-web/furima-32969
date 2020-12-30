FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              { "Monpamyu27" }
    encrypted_password    { "Monpamyu27" }
    last_name             {"山田"}
    first_name            {"宗平"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"ソウヘイ"}
    birth_date            {"1988-12-31"}
  end
end
