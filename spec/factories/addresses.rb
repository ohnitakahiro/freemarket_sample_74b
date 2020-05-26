FactoryBot.define do
  
  factory :address do
    post_code {"1234567"}
    prefectures {"北海道"}
    city {"test"}
    block {"test"}
    phone_number {00000000000}
  end
end