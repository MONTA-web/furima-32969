class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :deadline
  has_one_attached :image

  with_options presence: true do
  validates :product_name, :description,:image
    validates :price, numericality: {only_integer: true,message: "Half-width number"}
  validates :category_id,:condition_id,:shipping_charge_id,:prefecture_id,:deadline_id, numericality: { other_than: 0 ,message: "Select"}
  end
  validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 ,message: "Out of setting range"}
end
