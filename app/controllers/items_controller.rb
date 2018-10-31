class ItemsController < ApplicationController

  # before_action :move_to_root

  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to "/users"
    else
      flash[:notice] = "出品に失敗しました。"
      render :index
    end
  end

  def show
    @items = Item.order(updated_at: :desc)
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :description, :size, :condition, :charge_method, :prefecture, :handling_time, :price, :large_category_id, :medium_category_id, :small_category_id, :bland_id, :delivery_method,images_attributes:[:image]).merge(user_id: 1)
  end

end

