class Item < ApplicationRecord
 has_one_attached :image

 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category, :condition, :postage, :prefecture, :delivery_day 
end
