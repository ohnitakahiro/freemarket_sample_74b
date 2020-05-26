FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/spec/fixtures/logo.png")}
    item
  end
end