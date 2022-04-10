class OrdersController < ApplicationController

  before_action :authenticate_user!, oniy: [:index, :create]
  before_action :set_order, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
    @order_payment = OrderPayment.new
  end


  def create
    @item = Item.find(params[:item_id])
    @order_payment = OrderPayment.new(order_params)
    if @order_payment.valid?
       pay_item
       @order_payment.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_payment).permit(:postcode, :prefecture_id, :city, :adress, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end