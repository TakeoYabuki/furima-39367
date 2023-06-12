class PurchaseController < ApplicationController
  
  def index
     @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  
  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
      if @purchase_address.valid?
        @purchase_address.save
        redirect_to root_path
      else 
        render :index  
      end 
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:zip_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
