class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, except: [:index, :show, :new, :create]

  def index
    @items = Item.order(created_at: :desc)
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
  end  

  def edit
    if @item.user_id == current_user.id && @item.purchase.nil?
    else
      redirect_to root_path
    end  
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
      if @item.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end    
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user == @item.user
      redirect_to root_path
    end
  end
end
