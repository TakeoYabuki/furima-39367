class PurchaseController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else 
      render :index  
    end 
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if user_signed_in? && current_user == @item.user
      redirect_to root_path
    end
  end

  def purchase_params
    params.require(:purchase_address).permit(:zip_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    price = @item.price
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
