class User < ApplicationRecord
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "should contain a combination of letters and numbers" }
  validates :first_name, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}ー]+\z/, message: "should be full-width characters" }
  validates :last_name, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}ー]+\z/, message: "should be full-width characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Mn}ー]+\z/, message: "should be full-width katakana characters" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Mn}ー]+\z/, message: "should be full-width katakana characters" }
  validates :birthday, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
end
