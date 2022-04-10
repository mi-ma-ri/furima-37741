class OrderPayment
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :postcode, :city, :adress, :building, :phone_num, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}[-][0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :adress
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(item_id: item_id,user_id: user_id)
    payment = Payment.create(order_id: order.id, prefecture_id: prefecture_id, postcode: postcode, city: city, adress: adress, building: building, phone_num: phone_num)
  end
end
