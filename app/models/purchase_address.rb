class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :house_number, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. It must be written in half size characters include hyphen(-)which would separate between former three and latter four digits" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :item_id 
    validates :user_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. It must be 10 or 11 digits" }
  end
 
  validates :token, presence: true
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end