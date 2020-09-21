require 'rails_helper'
describe UserAddress do
  before do
    @purchase = FactoryBot.build(:user_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "user_id, item_id, token, post_code, prefecture_id,city, address, building, phone_numberが存在すれば登録できる" do
        expect(@purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "トークン情報が空だと購入できない" do
        
      end
      it "郵便番号が空では購入できない" do
      end
      it "都道府県が空だと購入できない" do
      end
      it "市区町村が空では購入できない" do
      end
      it "番地が空では購入できない" do
      end
      it "電話番号が空では購入できない" do
      end
      it "郵便番号には-がないと購入できない" do
      end
      it "電話番号にはハイフンは不要で、11桁以内でないと購入できない" do
      end
    end
  end
end