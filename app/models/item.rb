class Item < ApplicationRecord
  has_one_attached :image 
  validates :image, presence: { message: "must be attached" }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :condition 
  belongs_to :postage 
  belongs_to :prefecture
  belongs_to :delivery_day 

  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: { message: "can't be blank" }, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end