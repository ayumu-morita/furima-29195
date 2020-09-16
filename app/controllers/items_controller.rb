class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? && @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        redirect_to action: :edit
      end
    else
      redirect_to action: :show
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :delivery_day_id, :fee_burden_id, :prefecture_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
