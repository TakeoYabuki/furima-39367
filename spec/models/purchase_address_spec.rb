require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '購入内容の確認' do
    context '新規登録できる場合' do
      it '全ての項目の入力が存在すれば購入できること' do
        expect(@purchase_address).to be_valid
      end

      it '建物名を入力しなくても購入できる' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '新規登録できない場合' do
      
      it "クレジットカード情報が空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が必須であること' do
        @purchase_address.zip_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code can't be blank")
      end

      it '郵便番号が3桁ハイフン4桁であること' do
        @purchase_address.zip_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code is invalid. It must be written in half size characters include hyphen(-)which would separate between former three and latter four digits")
      end

      it '郵便番号が半角文字列であること' do
        @purchase_address.zip_code = '１２３-４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code is invalid. It must be written in half size characters include hyphen(-)which would separate between former three and latter four digits")
      end

      it '都道府県が必須であること' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      

      it '電話番号が必須であること' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁未満の数字のみの場合' do
        @purchase_address.phone_number = '012345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. It must be 10 or 11 digits")
      end

      it '電話番号が11桁以上の数字のみの場合' do
        @purchase_address.phone_number = '012345678900'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. It must be 10 or 11 digits")
      end

      it '電話番号は半角数値のみ保存可能なこと' do
        @purchase_address.phone_number = '０１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. It must be 10 or 11 digits")
      end

      it '電話番号が数字ではない場合' do
        @purchase_address.phone_number = 'takeoyabuki'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. It must be 10 or 11 digits")
      end
    end
  end
end
