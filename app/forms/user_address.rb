class UserAddress
  include ActiveModel::Model
  attr_accessor :token, :purchase, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    # 住所に関するもの
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A0\d{10,11}\z/ }
    # トークンに関するもの
    validates :token
    # ユーザーに関するもの
    validates :user_id
    validates :item_id
  end

  def save
    #  商品の管理
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(purchase_id: @purchase.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end
