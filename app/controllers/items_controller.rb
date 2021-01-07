class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:edit]
  before_action :set_item,only:[:show,:update,:contributor_confirmation,:edit,:destroy]
  before_action :contributor_confirmation,only:[:edit,:destroy,:update]
  before_action :purchased,only:[:edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show    
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name,:description,:category_id,:condition_id,:shipping_charge_id,:prefecture_id,:deadline_id,:price, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user  
  end

  def purchased
    if @item.order.present?
      redirect_to root_path
    end
  end

  


end
