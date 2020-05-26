class Item < ApplicationRecord
  belongs_to :user
  
  # 画像を複数枚投稿できるようにする
  has_many :images, dependent: :destroy, inverse_of: :item
  accepts_nested_attributes_for :images, allow_destroy: true

  # カテゴリー機能
  belongs_to :category

  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_player
  belongs_to_active_hash :preparation_day
  # バリデーション
  validates :name, :introduction, :category_id, :condition_id, :postage_player_id, :region_id, :preparation_day_id, :price, presence: true
  validates :price, numericality: { only_integer: true , greater_than: 299, less_than: 9999999 }
  validates_associated :images
  validates :images, presence: true
end
