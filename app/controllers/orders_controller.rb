class OrdersController < ApplicationController
before_action :authenticate_user!,only:[:index,:create]
before_action :set_item,except:[:order_params,:pay_item]
before_action :return_index,only:[:index,:create]
before_action :purchased_item,only:[:index,:create]

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
       pay_item
       @item_order.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def return_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def purchased_item
    if @item.order.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
