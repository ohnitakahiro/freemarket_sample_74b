class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :comments dependent: :destroy
  # has_many :items dependent: :destroy
  # has_many :orders dependent: :destroy
  # has_many :credit_card 
  has_many :addresses

#バリデーション
  validates :nickname,           presence: true
  validates :password,           presence: true, length: {minimum: 7 }, confirmation: true
  validates :family_name,        presence: true
  validates :first_name,         presence: true
  validates :family_name_kana,   presence: true
  validates :first_name_kana,    presence: true
  validates :birthday,           presence: true
  
  # def password_required?
  #   @user = User.encrypted_password
  #   if @user < 7
  #     render :new
  #   else
  #     super
  #   end      
  # end
  # スーパーライドを上書きするか？

  #deviseのバリデーション
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end

