class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
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
    params.require(:item).permit(:title,:text,:category_id, :delivery_day, :fee_burden, :prefecture, :status)
    # imageカラムのDBへの保存を許可↓
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
