class ItemsController < ApplicationController

  # before_action :move_to_root

  def index
    @items = Item.order("updated_at desc")
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
  end

end
