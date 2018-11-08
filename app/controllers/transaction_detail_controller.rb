class TransactionDetailController < ApplicationController

def show
  @item = Item.find(params[:id])
  @images = @item.images
  @user = @item.user
end

def update
  item = Item.find(params[:id])
  if item.status == "1"
    item.update(status: "2")
    redirect_to users_listing_path
    flash[:saler_notice] = "商品の到着を登録しました。"
  else
    item.update(status: "1")
    redirect_to users_listing_path
    flash[:buyer_npticestop] = "商品の発送を登録しました。"
  end
end

end

