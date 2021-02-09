require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'all ok' do
      expect(@user.valid?).to eq true 
    end
  end

    context '新規登録できないとき' do
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが、@を含んでいなければ登録できない' do
        @user.email = 'furima.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが、5文字以下での入力の時は登録できない' do  
        @user.password = '00000' 
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'ユーザー本名の名字は、空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名の名前は、空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
       
      end
      it 'ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.last_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.first_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'ユーザー本名の名字のフリガナは、空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名の名前のフリガナは、空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名の名字のフリガナが全角入力でなければ登録できないこと' do
        @user.last_name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'ユーザー本名の名前のフリガナが全角入力でなければ登録できないこと' do
        @user.first_name_kana  = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '生年月日が空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end

    end
  end
end






    

