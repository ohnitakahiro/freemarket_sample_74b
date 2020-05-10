class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :orders, dependent: :destroy
  belongs_to :user, dependent: :destroy
  belongs_to :category, dependent: :destroy
  belongs_to :size, dependent: :destroy
  belongs_to :bland, dependent: :destroy
  belongs_to :item_condition, dependent: :destroy
  belongs_to :postage_player, dependent: :destroy
  belongs_to :region, dependent: :destroy
  belongs_to :preparation_day, dependent: :destroy
end
