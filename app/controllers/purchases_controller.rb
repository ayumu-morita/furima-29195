class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root

  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path 
    end
    @purchase = Purchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = UserAddress.new(purchase_params)
    # binding.pry
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:token, :post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
