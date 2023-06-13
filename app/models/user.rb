class User < ApplicationRecord

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    validates :nickname, presence: true
    
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: "should contain a combination of letters and numbers"

    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "should be full-width characters" } do
      validates :first_name
      validates :last_name
    end  
      
    with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "should be full-width katakana characters"} do
      validates :first_name_kana
      validates :last_name_kana
    end

      validates :birthday, presence: true

      has_many :items
      has_many :purchases
 end