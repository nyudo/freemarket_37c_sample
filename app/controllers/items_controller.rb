class ItemsController < ApplicationController

PICTURE_COUNT = 4
  before_action :set_item ,only:[:payjp,:destroy,:show,:edit,:update,:stop,:resume,:buy]

  def payjp
    require 'payjp'
    Payjp.api_key = PAYJP_SECRET_KEY
    @user = User.find(1)   #id: 1は仮置きです。ログイン機能実装したらcurrent_user.idとします。
    @item.with_lock do
      if @item.buyer_id == nil
        Payjp::Charge.create(
          :amount => @item.price,
          :card => params['payjp-token'],
          :currency => 'jpy',
        )
        @item.update!(buyer_id: @user.id)
        redirect_to  users_purchase_path
        flash[:notice] = '購入が完了しました。'
      else
        redirect_to :root
        flash[:notice] = '購入に失敗しました。申し訳ありません。売却済みの商品です。'
      end
    end
  end

  def index

    @items = Item.where(status: :displayed).order("created_at desc")

  end

  def new
    @item = Item.new
    PICTURE_COUNT.times{@item.images.build}
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to users_listing_path
    else
      flash[:notice] = "出品に失敗しました。"
      redirect_to :root
    end
  end

# user_id 1は仮置きです。ログイン機能実装したらcurrent_user.idとします。
  def destroy
    if @item.user_id == 1
       @item.destroy
       redirect_to users_listing_path
    else
       redirect_to item_path(@item.id)
    end
  end

  def show
    @user = User.find(1) #挙動確認用の仮置きユーザーです。（商品詳細ページでuserによって購入or編集を切り替えるため）
    @images = @item.images.order("created_at DESC")
  end

  def edit
    # @item.images = Image.new if @item.images.blank?
    # count = @item.images.count
    # (PICTURE_COUNT - count).times {@item.images.build}
    # @item.images.cache_key unless @item.images.blank?
  end

  def update
    if @item.update(item_params)
      redirect_to users_listing_path, notice: "商品を編集しました"
      flash[:resume] = "出品の再開をしました。"
    else
      redirect_to edit_item_path
    end
  end

  def stop
    if @item.update(status: :stopped)
      redirect_back(fallback_location: root_path)
      flash[:stop] = "出品の一旦停止をしました。"
    else
      redirect_to item_path(@item.id)
      flash[:stop] = "出品の一旦停止に失敗しました。"
    end
  end

  def resume
    if @item.update(status: :displayed)
      redirect_back(fallback_location: root_path)
      flash[:resume] = "出品の再開をしました。"
    else
      redirect_to item_path(@item.id)
      flash[:resume] = "出品の再開に失敗しました。"
    end
  end

  def buy
    @image = @item.images.first
  end

  def area
    @items = Item.where(prefecture: params[:prefecture])
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :size, :condition, :charge_method, :prefecture, :handling_time, :price, :large_category_id, :medium_category_id, :small_category_id, :bland_id, :delivery_method,images_attributes:[:image, :image_cache, :_destroy, :id]).merge(status: :displayed).merge(user_id: 1) #idは仮置きです。
  end


end

