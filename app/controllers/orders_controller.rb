class OrdersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :create]
  before_action :set_order, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
    @order_payment = OrderPayment.new
  end


  def create
    @item = Item.find(params[:item_id])
    @order_payment = OrderPayment.new(order_params)
    if @order_payment.valid?
       @order_payment.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_payment).permit(:postcode, :prefecture_id, :city, :adress, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end