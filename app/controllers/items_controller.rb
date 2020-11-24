class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
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
  end
    
  def edit
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
      redirect_to root_path
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
