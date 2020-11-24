class ItemsController < ApplicationController
  before_action :set_itme, except: [:index, :new, :create, :show]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :sold_out_item, only: [:show]

  def index
    @items = Item.all.order(created_at: :desc)
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
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :postage_payer_id, :postage_area_id, :postage_day_id, :item_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

   #def sold_out_item
    #redirect_to root_path if @item.order.present?
   #end

end
