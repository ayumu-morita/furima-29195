class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    # @items = Item.order('created_at DESC')
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
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :delivery_day_id, :fee_burden_id, :prefecture_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
