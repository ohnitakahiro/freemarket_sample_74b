FactoryBot.define do

  factory :user do
    nickname        {"test"}
    email           {"test@gmail.com"}
    password        {"00000000"}
    family_name      {"test"}
    first_name      {"test"}
    family_name_kana    {"test"}
    first_name_kana    {"test"}
    birthday          {"2000-01-01"}
  end
end
