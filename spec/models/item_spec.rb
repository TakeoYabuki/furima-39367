require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      
      it '全ての項目の入力が存在すれば商品出品できること' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品できない場合' do

      it '商品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image must be attached")
      end

      it '商品名が必須であること' do
         @item.name = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明があること' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      
      it '商品の状態の情報があること' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '送料の負担の情報であること' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it '発送元の地域の情報が必要であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数の情報であること' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      
      it '価格の情報があること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満では出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が10,000,000円以上では出品できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格は半角数値のみで保存可能であること' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end  
  end  
end
