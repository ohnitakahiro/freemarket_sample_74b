class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :category
  
  has_many :images, dependent: :destroy, inverse_of: :item
  accepts_nested_attributes_for :images, allow_destroy: true

  # アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_player
  belongs_to_active_hash :preparation_day
end
