class OrdersController < ApplicationController

  def index
    @item_order = ItemOrder.new
  end

  def create
   
  end

  private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone)
  end
end
