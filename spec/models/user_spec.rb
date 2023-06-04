require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
       end

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it 'メールアドレスが一意性であること' do
        existing_user = FactoryBot.create(:user, email: 'existing@example.com')
        @user.email = 'existing@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'invalid_email'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    
      it 'パスワードは、６文字以上での入力が必須であること' do
        @user.password = 'Take5' 
        @user.password_confirmation ='Take5'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end  
  
      it 'パスワードは、半角英数字混合での入力が必須であること(文字列のみ)' do
        @user.password = 'TakeoY'
        @user.password_confirmation = "TakeoY"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password should contain a combination of letters and numbers")
      end
      
      it 'パスワードは、半角英数字混合での入力が必須であること(数字のみ)' do
        @user.password = '123456' 
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password should contain a combination of letters and numbers")
      end
      
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = 'Takeo35' 
        @user.password_confirmation = 'Takeo36'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it 'お名前(全角)は、名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      
      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it '名字(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
          @user.last_name = 'Yabuki'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name should be full-width characters")
      end
     
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'Takeo'  
        @user.valid?
        expect(@user.errors.full_messages).to include("First name should be full-width characters")
      end
     
      it 'お名前カナ(全角)は,名字が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end


      it 'お名前カナ(全角)は,名前が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      
      it '名字カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'Yabuki 矢吹 やぶき'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana should be full-width katakana characters")
      end

      it '名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = 'Takeo 剛央 たけお'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana should be full-width katakana characters")
      end
          
      it '生年月日が必須であること' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end 
    end
  end
end    