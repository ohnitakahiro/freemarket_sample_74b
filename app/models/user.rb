class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :address, dependent: :destroy
  has_many :credit_card, dependent: :destroy
end
