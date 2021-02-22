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
      it '販売価格が299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it '販売価格が10000000円以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it '販売価格が数値以外の場合登録できない' do
        @item.price = '販がコ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '商品の説明が空では登録できない' do  
        @item.info = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーが空では登録できない' do  
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '商品の状態が空では登録できない' do  
        @item.condition_id = 0 
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it '発送料の負担が空では登録できない' do  
        @item.cost_id = 0 
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be other than 0")
      end
      it '発送元の地域が空では登録できない' do
        @item.prefecture_code_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture code must be other than 0")
      end
      it '発送までの日数が空では登録できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 0")
      end

    end
  end
end




