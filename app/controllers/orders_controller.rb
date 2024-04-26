class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    # ここで決済処理に必要なパラメータを扱います。
  end
end

# class OrdersController < ApplicationController

  # def index
    # @item = Item.find(params[:item_id])
  # end

  # def create

  # end

  # private

  # def メソッド名
    # params.permit(指定のカラムを記述する)
  # end
# end
