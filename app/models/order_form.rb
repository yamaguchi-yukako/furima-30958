class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code , :prefecture_code_id , :city  , :house_number, :building_name ,:phone_number ,:order

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id 
    validates :item_id 
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number,  format: { with: /\A\d{11}\z/, message: 'Input only number' }
   
  end
  validates :prefecture_code_id, numericality: { other_than: 0, message: "can't be blank" }
  

  def save
    # 各テーブルにデータを保存する処理を書く
    order.create(user_id: user_id, item_id: item_id)
    shipping_address.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order: order)
end
end