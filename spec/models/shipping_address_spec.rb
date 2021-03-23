require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入内容の確認' do
    context '購入できるとき' do
    it 'all ok' do
      expect(@order.valid?).to eq true 
    end
  end

    context '購入できないとき' do
      it 'card_numberが空では登録できないこと' do
        @order.card_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Card_number cant be blank")
      end
     
      it 'card_exp_monthが空では登録できない' do
        @order.card_exp_month = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Card_exp_month can't be blank")
      end
      it 'card_exp_monthが、3文字以上での入力の時は登録できない' do  
        @order.card_exp_month = '12' 
        @order.valid?
        expect(@order.errors.full_messages).to include("Card_exp_month is too long (maximum is 2characters)")
      end
      it 'card_exp_monthが、半角英数字でなければ登録ができない(半角英数字)' do  
        @order.card_exp_month = '12' 
        @order.valid?
        expect(@order.errors.full_messages).to include("Card_exp_month is  numbers")
      end
      it 'card_exp_yearが空では登録できないこと' do  
        @order.card_exp_year = '' 
        @order.valid?
        expect(@user.errors.full_messages).to include("Card_exp_year ican't be blank")
      end
      it 'card_exp_yearが、半角英数字でなければ登録ができない(半角英数字)' do  
        @order.card_exp_year = '99' 
        @order.valid?
        expect(@user.errors.full_messages).to include("Card_exp_year is  numbers")
      end
      it 'card_exp_yearが、3文字以上での入力の時は登録できない' do   
        @order.card_exp_year = '99' 
        @order.valid?
        expect(@order.errors.full_messages).to include("Card_exp_year is too long (maximum is 2characters)")
      end
      it 'card_cvcが、空では登録できないこと' do  
        @order.card_cvc= '' 
        @order.valid?
        expect(@order.errors.full_messages).to include("Card_cvc can't be blank")
      end
      it 'card_cvcが、半角英数字でなければ登録ができない(半角英数字)' do  
        @order.card_cvc= '999' 
        @order.valid?
        expect(@order.errors.full_messages).to include("Card_cvc is  numbers")
      end
      it 'card_cvcが、4文字以上での入力の時は登録できない' do   
        @order.card_cvc = '999' 
        @order.valid?
        expect(@order.errors.full_messages).to include("Card_cvc is too long (maximum is 3characters)")
      end

      it 'postal_codeが、半角英数字でなければ登録ができない(半角英数字)' do  
        @order.postal_code= '123-4567' 
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal_code is include numbers and characters")
      end
      it 'postal_codeに、ハイフン入力が無い時は登録できない' do   
        @order.postal_code = '123-4567' 
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal_code is is include numbers and characters)")
      end
       it 'postal_codeが、空では登録できないこと' do  
        @order.postal_code= ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal_code can't be blank")
      end
        it 'prefecture_code_idが、空では登録できないこと' do  
        @order.prefecture_code_id= ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture_code_id can't be blank")
      end

       it 'cityが、空では登録できないこと' do  
        @order.city= '' 
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
     it 'cityが、空では登録できないこと' do  
        @order.city= '横浜市緑区'
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが、空では登録できないこと' do  
        @order.house_number= ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House_number can't be blank")
      end
      it 'house_numberが、空では登録できないこと' do  
        @order.house_number= '青山1−1−1 '
        @order.valid?
        expect(@order.errors.full_messages).to include("House_number can't be blank")
      end
      it 'building_nameが、空では登録できないこと' do  
        @order.building_name= ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Building_namer can't be blank")
      end
      it 'building_nameが、空では登録できないこと' do  
        @order.building_name= '柳ビル103'
        @order.valid?
        expect(@order.errors.full_messages).to include("Building_namer can't be blank")
      end
 it 'phone_numberが、空では登録できないこと' do  
        @order.phone_number= ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone_number can't be blank")
      end
 it 'phone_numberが、空では登録できないこと' do  
        @order.phone_number= '09012345678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone_number can't be blank")
      end

end
end
end

