class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit]

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)  # アイテムの詳細ページにリダイレクト
    else
      render :edit  # エラーがあった場合は再び編集ページを表示
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price, :image)
  end

  def check_user
    item = Item.find(params[:id])
    if current_user.id != item.user_id
      redirect_to root_path
    end
  end

end
