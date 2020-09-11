class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseSendingdestination.new
    # @user = User.new
  end

  def create
    @purchase = PurchaseSendingdestination.new(order_params)
    # 保存できなかった場合、createアクションに戻って来た時にitemの情報がないため定義しておく必要がある。
    @item = Item.find(params[:item_id])
    if @purchase.valid?
      pay_item
      # binding.pry
      @purchase.save
      return redirect_to root_path
    else
      # binding.pry
      render :index
    end
  end

  private

  def order_params
    params.permit(:token, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
