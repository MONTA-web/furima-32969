class ItemOrder

  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:house_number,:building_name,:phone

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A[0-9]+\z/}
  end
    validates :prefecture_id, numericality:{ other_than: 0, message: "Select"}

  def save
    Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,building_name: building_name, phone: phone, order_id: order.id)
  end

end