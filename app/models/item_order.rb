class ItemOrder

  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:house_number,:building_name,:phone,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/,message: "input correctly"}
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A[0-9]+\z/,message: "input only number"}
    validates :token
  end
    validates :prefecture_id, numericality:{ other_than: 0, message: "Select"}

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,building_name: building_name, phone: phone, order_id: order.id)
  end

end