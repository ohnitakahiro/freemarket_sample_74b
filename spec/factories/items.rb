FactoryBot.define do
  factory :item do
    name              {"test"}
    introduction      {"test"}
    condition_id      {"1"}
    postage_player_id {"2"}
    region_id         {"2"}
    preparation_day_id {"1"}
    price             {"500"}
    after(:build)do |item|
      item.images << build(:image, item_id: item)
    end
  end

  factory :category do
    name              {"aaa"}
  end
end