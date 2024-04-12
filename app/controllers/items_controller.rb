class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  def index

  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price) # ここにはItemモデルの属性を追加してください
  end
end
