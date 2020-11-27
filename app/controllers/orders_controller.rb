class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:create, :index]
  
  def index
    if current_user.id == @item.user_id || @item.order
      redirect_to root_path
    else
      @order = OrderDonation.new
    end
  end

  def create
    @order = OrderDonation.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else 
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_donation).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:item_price],
        card: order_params[:token],
        currency: 'jpy'
      )
   end

end
