require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  # 新規登録
  describe '必須項目を満たしていれば出品できる' do
    context '出品がうまくいくとき' do
      it 'user、name、description、price、category_id、status_id、feeBurden_id、prefecture_id, delivery_day_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'ログインしていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do 
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionがないと出品できない' do 
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idがないと出品できない' do 
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idがないと出品できない' do 
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'fee_burden_idがないと出品できない' do 
        @item.fee_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee burden can't be blank")
      end
      it 'prefecture_idがないと出品できない' do 
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_day_idがないと出品できない' do 
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'price_idがないと出品できない' do 
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300以下だと出品できない      ' do 
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格の範囲が、¥9,999,999以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      
  end
end
end