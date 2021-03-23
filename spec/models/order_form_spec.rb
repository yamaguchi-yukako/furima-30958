require 'rails_helper'

RSpec.describe OrderForm, type: :model do

  before do
    
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    
    @orderform = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id )
    sleep(1)
  end

  describe '購入内容の確認' do
    context '購入できるとき' do
    it 'all ok' do
      expect(@orderform.valid?).to eq true 
    end
  end

    context '購入できないとき' do
      
      it 'postal_codeに、ハイフン入力が無い時は登録できない' do   
        @orderform.postal_code = "1234567" 
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
       it 'postal_codeが、空では登録できないこと' do  
        @orderform.postal_code= ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Postal code can't be blank")
      end
        it 'prefecture_code_idが、空では登録できないこと' do  
        @orderform.prefecture_code_id= 0
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Prefecture code can't be blank")
      end

       it 'cityが、空では登録できないこと' do  
        @orderform.city= '' 
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("City can't be blank")
      end
    
      it 'house_numberが、空では登録できないこと' do  
        @orderform.house_number= ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("House number can't be blank")
      end
      
      it 'phone_numberが、空では登録できないこと' do  
        @orderform.phone_number= ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが、半角英数では登録できないこと(半角英数字)' do  
        @orderform.phone_number= 'abc'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number Input only number and maximum 11disits")
      end
      it 'phone_numberが、12桁では登録できないこと(半角英数字)' do  
        @orderform.phone_number= '123456789012'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number Input only number and maximum 11disits")
      end


end
end
end


  

