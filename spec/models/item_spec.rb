require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '出品登録できるとき' do
    it 'all ok' do
      expect(@item.valid?).to eq true 
    end
    end

    context '出品登録できないとき' do
      
      it '商品名が空では登録できないこと' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '販売価格が空では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it '商品の説明が空では登録できない' do  
        @item.info = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーが空では登録できない' do  
        @item.category_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態が空では登録できない' do  
        @item.condition_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it '発送料の負担が空では登録できない' do  
        @item.cost_id = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost is not a number")
      end
      it '発送元の地域が空では登録できない' do
        @item.prefecture_code_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture code is not a number")
      end
      it '発送までの日数が空では登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day is not a number")
      end

    end
  end
end




