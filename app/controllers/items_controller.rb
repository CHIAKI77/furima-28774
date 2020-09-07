class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
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
    @items = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @items.update(item_params)
      redirect_to item_path(@items)
    else
      render :edit
    end
  end

  def destroy
    if @items.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_burden_id, :shipping_region_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @items = Item.find(params[:id])
  end
end
